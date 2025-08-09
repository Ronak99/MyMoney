import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';
import 'package:my_money/model/account.dart';

@entity
class Transaction {
  @primaryKey
  final int id;

  final String name;
  final String description;
  final double amount;
  final DateTime date;
  final Category category;
  final Account account;

  Transaction({
    required this.id,
    required this.description,
    required this.name,
    required this.amount,
    required this.date,
    required this.category,
    required this.account,
  });
}
