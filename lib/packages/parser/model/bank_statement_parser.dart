part of '../parser.dart';

abstract class BankStatementParser {
  Future<List<Transaction>> parse();
}