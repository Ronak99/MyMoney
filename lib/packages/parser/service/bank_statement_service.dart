part of '../parser.dart';

class BankStatementService {
  static BankStatementService? _instance;

  static BankStatementService get instance {
    _instance ??= BankStatementService._();
    return _instance!;
  }

  BankStatementService._();

  final Parser _fiStatementParser = FiStatementParser();
  final Parser _iciciStatementParser = IciciStatmentParser();
  final Parser _sbiStatementParser = SbiStatementParser();
  final Parser _hdfcStatementParser = HdfcStatementParser();

  final PdfManager _pdfManager = PdfManager();

  // Future<List<Transaction>> extractViaAsset({
  //   required Bank bank,
  //   required String password,
  //   required String filename,
  // }) async {
  //   String content = await _pdfManager.loadAndRetrieveContent(
  //     filename: filename,
  //     password: password,
  //   );
  //   switch (bank) {
  //     case Bank.fi:
  //       return _fiStatementParser.parse(content);
  //     case Bank.sbi:
  //       return _sbiStatementParser.parse(content);
  //     case Bank.hdfc:
  //       return _hdfcStatementParser.parse(content);
  //     case Bank.icici:
  //       return _iciciStatementParser.parse(content);
  //   }
  // }

  Future<List<Transaction>> extract({
    required Bank bank,
    required File file,
    String? password,
  }) async {
    String content = await _pdfManager.loadAndRetrieveContentFromPdfFile(
      file,
      password: password,
    );
    switch (bank) {
      case Bank.fi:
        return _fiStatementParser.parse(content);
      case Bank.sbi:
        return _sbiStatementParser.parse(content);
      case Bank.hdfc:
        return _hdfcStatementParser.parse(content);
      case Bank.icici:
        return _iciciStatementParser.parse(content);
    }
  }
}
