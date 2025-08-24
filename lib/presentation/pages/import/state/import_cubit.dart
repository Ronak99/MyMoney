import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/packages/parser/exceptions/exceptions.dart';
import 'package:my_money/packages/parser/parser.dart';
import 'package:my_money/presentation/pages/import/state/import_state.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/routes/routes.dart';
import 'package:my_money/presentation/widgets/custom_bottom_sheet.dart';

class ImportCubit extends Cubit<ImportState> {
  ImportCubit() : super(ImportState());

  void onImport(BuildContext context, {required Bank bank}) async {
    if (RouteGenerator.accountCubit.state.accounts.isEmpty) {
      CustomBottomSheet.noBankAccount().show(context);
      return;
    }
    try {
      final pickedFile = await pickFile();
      if (!context.mounted) return;
      await _handleImport(
        context,
        pickedFile: pickedFile,
        bank: bank,
      );
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

  Future<void> _handleImport(
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

      if (!context.mounted) return;

      context.push(Routes.VIEW_IMPORTS.value);
    } on PdfLockedException {
      String? password = await CustomBottomSheet.pdfLocked().show(context);
      if (password == null) return;
      if (!context.mounted) return;

      emit(state.copyWith(previousPassword: password));

      _handleImport(
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

      _handleImport(
        context,
        pickedFile: pickedFile,
        bank: bank,
        password: password,
      );
    } catch (e) {
      print(e);
    }
  }
}
