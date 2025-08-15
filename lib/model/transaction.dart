import 'package:floor/floor.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction_category.dart';

@Entity(
  tableName: 'transactions',
  foreignKeys: [
    ForeignKey(
      childColumns: ['categoryId'],
      parentColumns: ['id'],
      entity: TransactionCategory,
    ),
    ForeignKey(
      childColumns: ['accountId'],
      parentColumns: ['id'],
      entity: Account,
    ),
  ],
  indices: [
    Index(value: ['date']),
    Index(value: ['accountId']),
    Index(value: ['categoryId']),
  ],
)
class Transaction {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String name;
  final String description;
  final double amount;
  final DateTime date;
  final int? categoryId;
  final int? accountId;
  final TransactionType transactionType;

  @ignore
  final Account? account;

  @ignore
  final TransactionCategory? category;

  Transaction({
    this.id = 0,
    required this.description,
    required this.name,
    required this.amount,
    required this.date,
    this.transactionType = TransactionType.none,
    this.categoryId,
    this.accountId,
    this.account,
    this.category,
  });
}


enum TransactionType {
  expense,
  income,
  none,
}
