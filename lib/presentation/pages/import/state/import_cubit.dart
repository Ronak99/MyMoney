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

  void onImport(BuildContext context, {Bank? bank, PeerApp? peerApp}) async {
    if (RouteGenerator.accountCubit.state.accounts.isEmpty) {
      CustomBottomSheet.noBankAccount().show(context);
      return;
    }
    try {
      final pickedFile = await pickFile(shouldPickCsv: bank == null);

      if (bank != null) {
        if (!context.mounted) return;
        await _handleBankStatementImport(
          context,
          pickedFile: pickedFile,
          bank: bank,
        );
      }

      if (peerApp != null) {
        if (!context.mounted) return;
        await _handlePeerAppDataImport(context, pickedFile: pickedFile);
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
    required FilePickerResult pickedFile,
  }) async {
    PlatformFile file = pickedFile.files.first;

    emit(state.copyWith(isLoading: true));

    List<Transaction> transactions =
        await AppStatementService.instance.extract(file: File(file.path!));

    emit(
      state.copyWith(
        isLoading: false,
        transactions: transactions,
      ),
    );

    if (!context.mounted) return;
    context.push(Routes.VIEW_IMPORTS.value);
  }

  Future<void> _handleBankStatementImport(
    BuildContext context, {
    required FilePickerResult pickedFile,
    required Bank bank,
    String? password,
  }) async {
    PlatformFile file = pickedFile.files.first;
    try {
      emit(state.copyWith(isLoading: true));

      List<Transaction> transactions =
          await BankStatementService.instance.extract(
        file: File(file.path!),
        bank: bank,
        password: password,
      );

      emit(
        state.copyWith(
          isLoading: false,
          transactions: transactions,
          previousPassword: null,
        ),
      );

      updateDate(action: DateAction.setSpecific, specificDate: transactions.first.date);

      if (!context.mounted) return;

      context.push(Routes.VIEW_IMPORTS.value);
    } on PdfLockedException {
      String? password = await CustomBottomSheet.pdfLocked().show(context);
      if (password == null) return;
      if (!context.mounted) return;

      emit(state.copyWith(previousPassword: password));

      _handleBankStatementImport(
        context,
        pickedFile: pickedFile,
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

      _handleBankStatementImport(
        context,
        pickedFile: pickedFile,
        bank: bank,
        password: password,
      );
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

    List<Transaction> filteredTransactions = state.transactions
        .where((e) =>
            e.date.isAfter(targetDate.startOfTheMonth) &&
            e.date.isBefore(targetDate.endOfTheMonth))
        .toList();

    emit(
      state.copyWith(
        selectedDate: targetDate,
        filteredTransactions: filteredTransactions,
      ),
    );
  }
}
