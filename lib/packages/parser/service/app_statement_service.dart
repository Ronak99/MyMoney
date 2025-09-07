part of '../parser.dart';

class AppStatementService {
  static AppStatementService? _instance;

  static AppStatementService get instance {
    _instance ??= AppStatementService._();
    return _instance!;
  }

  AppStatementService._();

  final _csvParser = CsvParser();
  final _csvManager = CsvManager();

  Future<List<Transaction>> extract({
    required File file,
  }) async {
    final content = await _csvManager.loadContent(file);
    final transactions = _csvParser.parse(content);
    return transactions;
  }

  void ronak(){}
}
