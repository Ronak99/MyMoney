part of '../parser.dart';

enum Bank {
  fi,
  sbi,
  hdfc,
  icici,
}

class BankStatementService {
  static BankStatementService? _instance;

  static BankStatementService get instance {
    _instance ??= BankStatementService._();
    return _instance!;
  }

  BankStatementService._();

  final BankStatementParser _fiStatementParser = FiStatementParser();
  final _PdfManager _pdfManager = _PdfManager();

  Future<List<Transaction>> extract({
    required Bank bank,
    required String password,
  }) async {
    String content =
        await _pdfManager.loadAndRetrieveContent(password: password);
    switch (bank) {
      case Bank.fi:
        return _fiStatementParser.parse(content);
      case Bank.sbi:
        return _fiStatementParser.parse(content);
      case Bank.hdfc:
        return _fiStatementParser.parse(content);
      case Bank.icici:
        return _fiStatementParser.parse(content);
    }
  }
}
