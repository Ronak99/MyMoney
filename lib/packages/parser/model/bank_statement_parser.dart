part of '../parser.dart';

abstract class BankStatementParser {
  List<Transaction> parse(String text);
}