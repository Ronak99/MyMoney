import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';
import 'package:my_money/model/account.dart';

@Entity(tableName: 'transactions', foreignKeys: [
  ForeignKey(
    childColumns: ['categoryId'],
    parentColumns: ['id'],
    entity: Category,
  ),
  ForeignKey(
    childColumns: ['accountId'],
    parentColumns: ['id'],
    entity: Account,
  ),
])
class Transaction {
  @primaryKey
  final int id;

  final String name;
  final String description;
  final double amount;
  final DateTime date;
  final String categoryId;
  final String accountId;

  Transaction({
    required this.id,
    required this.description,
    required this.name,
    required this.amount,
    required this.date,
    required this.categoryId,
    required this.accountId,
  });
}
