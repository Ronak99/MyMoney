part of '../parser.dart';

abstract class Parser {
  List<Transaction> parse(String text);
}