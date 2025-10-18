import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/enums/date_action.dart';
import 'package:my_money/extensions/date.dart';
import 'package:my_money/extensions/peer_app.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/packages/parser/exceptions/exceptions.dart';
import 'package:my_money/packages/parser/parser.dart';
import 'package:my_money/presentation/pages/import/state/import_state.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/routes/routes.dart';
import 'package:my_money/presentation/widgets/custom_bottom_sheet.dart';

class ImportCubit extends Cubit<ImportState> {
  ImportCubit() : super(ImportState()) {
    emit(state.copyWith(selectedDate: DateTime.now()));
  }

  List<Transaction> get filteredTransactions => state.selectedDate == null
      ? []
      : state.transactions
          .where((e) =>
              e.date.isAfter(state.selectedDate!.startOfTheMonth) &&
              e.date.isBefore(state.selectedDate!.endOfTheMonth))
          .toList();

  void onImport(BuildContext context, {Bank? bank, PeerApp? peerApp}) async {
    bool shouldProcceed = false;
    if (RouteGenerator.accountCubit.state.accounts.isEmpty) {
      await CustomBottomSheet.noBankAccount(
        onActionButtonPressed: (context) async {
          final account = await CustomBottomSheet.modifyAccount().show();
          if (account != null) {
            RouteGenerator.context!.pop();
            shouldProcceed = true;
          }
        },
      ).show();
    } else {
      shouldProcceed = true;
    }

    if (!shouldProcceed) return;
    final pickedFile = await pickFile(shouldPickCsv: bank == null);

    emit(
      state.copyWith(
        selectedFile: File(pickedFile.files.first.path!),
        selectedBank: bank,
        selectedPeerApp: peerApp,
        transactions: [],
      ),
    );

    // navigate to view imports
    if (!context.mounted) return;
    context.push(Routes.VIEW_IMPORTS.value);
  }

  void resolveContent(BuildContext context) async {
    try {
      if (state.selectedBank != null) {
        if (!context.mounted) return;
        await _handleBankStatementImport(
          context,
          file: state.selectedFile!,
          bank: state.selectedBank!,
        );
      }

      if (state.selectedPeerApp != null) {
        if (!context.mounted) return;
        await _handlePeerAppDataImport(context, file: state.selectedFile!);
      }
    } catch (e) {}
  }

  Future<FilePickerResult> pickFile({bool shouldPickCsv = false}) async {
    var pickedFile = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: shouldPickCsv ? ["csv"] : ["pdf"],
      type: FileType.custom,
    );

    if (pickedFile == null) throw Exception("No files picked");

    return pickedFile;
  }

  Future<void> _handlePeerAppDataImport(
    BuildContext context, {
    required File file,
  }) async {
    emit(state.copyWith(isLoading: true));

    List<Transaction> transactions =
        await AppStatementService.instance.extract(file: file);

    emit(
      state.copyWith(
        isLoading: false,
        transactions: transactions,
      ),
    );
  }

  Future<void> _handleBankStatementImport(
    BuildContext context, {
    required File file,
    required Bank bank,
    String? password,
  }) async {
    try {
      emit(state.copyWith(isLoading: true));

      List<Transaction> transactions =
          await BankStatementService.instance.extract(
        file: File(file.path),
        bank: bank,
        password: password,
      );

      transactions = transactions.map((e) {
        return e.copyWith(
          account: RouteGenerator.accountCubit.state.accounts.first,
          accountId: RouteGenerator.accountCubit.state.accounts.first.id,
        );
      }).toList();

      emit(
        state.copyWith(
          transactions: transactions,
          previousPassword: null,
          isLoading: false,
        ),
      );

      updateDate(
        action: DateAction.setSpecific,
        specificDate: transactions.first.date,
      );
    } on PdfLockedException {
      String? password = await CustomBottomSheet.pdfLocked().show();
      if (password == null) return;
      if (!context.mounted) return;

      emit(state.copyWith(previousPassword: password));

      await Future.delayed(Duration(seconds: 1));

      _handleBankStatementImport(
        context,
        file: file,
        bank: bank,
        password: password,
      );
    } on PdfWrongPasswordException {
      String? password = await CustomBottomSheet.wrongPassword(
        previousPassword: state.previousPassword ?? '',
      ).show(context);
      if (password == null) return;
      if (!context.mounted) return;

      emit(state.copyWith(previousPassword: password));

      // _handleBankStatementImport(
      //   context,
      //   file: file,
      //   bank: bank,
      //   password: password,
      // );
    } catch (e) {
      print(e);
    }
  }

  void updateDate({
    required DateAction action,
    DateTime? specificDate,
  }) {
    final DateTime targetDate = switch (action) {
      DateAction.setSpecific => specificDate ?? DateTime.now(),
      DateAction.incrementMonth => state.selectedDate!.nextMonth,
      DateAction.decrementMonth => state.selectedDate!.prevMonth,
    };

    emit(
      state.copyWith(
        selectedDate: targetDate,
      ),
    );
  }

  void updateTransaction(Transaction transaction) {
    int index = state.transactions.indexWhere((e) => transaction.id == e.id);
    if (index == -1) return;

    List<Transaction> copyOfList = List.from(state.transactions);
    copyOfList[index] = transaction;

    emit(state.copyWith(transactions: copyOfList));
  }
}
