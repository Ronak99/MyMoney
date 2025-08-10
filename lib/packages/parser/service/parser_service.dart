part of '../parser.dart';

class BankStatementService {
  final BankStatementParser parser;

  BankStatementService(this.parser);

  Future<List<Transaction>> parse() async {
    return await parser.parse();
  }
}