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
      onDelete: ForeignKeyAction.cascade,
    ),
    ForeignKey(
      childColumns: ['accountId'],
      parentColumns: ['id'],
      entity: Account,
      onDelete: ForeignKeyAction.cascade,
    ),
  ],
  indices: [
    Index(value: ['date'], name: 'idx_transactions_date'),
    Index(value: ['accountId'], name: 'idx_transactions_account'),
    Index(value: ['categoryId'], name: 'idx_transactions_category'),
  ],
)
class Transaction {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String notes;
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
    this.id,
    required this.notes,
    required this.amount,
    required this.date,
    this.transactionType = TransactionType.none,
    this.categoryId,
    this.accountId,
    this.account,
    this.category,
  });

  String get keyValues => "${date.year}_${date.month}_${date.day}_${amount}_$transactionType";

  factory Transaction.empty({
    TransactionCategory? category,
    Account? account,
  }) =>
      Transaction(
        notes: '',
        amount: 0,
        date: DateTime.now(),
        account: account,
        category: category,
        accountId: account?.id,
        categoryId: category?.id,
        transactionType: TransactionType.expense,
      );

  Transaction copyWith({
    int? id,
    String? notes,
    double? amount,
    DateTime? date,
    int? categoryId,
    int? accountId,
    TransactionType? transactionType,
    Account? account,
    TransactionCategory? category,
  }) {
    return Transaction(
      id: id ?? this.id,
      notes: notes ?? this.notes,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      categoryId: categoryId ?? this.categoryId,
      accountId: accountId ?? this.accountId,
      transactionType: transactionType ?? this.transactionType,
      account: account ?? this.account,
      category: category ?? this.category,
    );
  }
}

enum TransactionType {
  expense,
  income,
  transfer,

  /// when records are imported from bank statements - we may not be able to deduce the type of a given transaction, hence we mark them none by default
  /// instead of marking them as null.
  none,
}

/// TODO:
/// Make following changes to this model. Change accountId to sourceAccountId - representing where money got deducted from
/// Make another one called destinationAccountId - representing where money went in case transactionType = TransactionType.transfer
