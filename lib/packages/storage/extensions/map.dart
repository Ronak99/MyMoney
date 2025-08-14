import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/model/transaction_category.dart';

extension MapExtension on Map<String, Object?> {
  Account? toAccount() {
    if (this['a_id'] == null) return null;

    return Account(
      id: this['a_id'] as int,
      name: this['a_name'] as String,
      balance: (this['a_balance'] as num).toDouble(),
      createdOn: DateTime.parse(this['a_createdOn'] as String),
    );
  }

  TransactionCategory? toCategory() {
    if (this['c_id'] == null) return null;

    return TransactionCategory(
      id: this['c_id'] as int,
      name: this['c_name'] as String,
      description: this['c_description'] as String,
      type: CategoryType.values[(this['c_type'] as int)],
      createdOn: DateTime.parse(this['c_createdOn'] as String),
    );
  }

  Transaction toTransaction({
    required Account? account,
    required TransactionCategory? category,
  }) {
    return Transaction(
      id:            this['t_id'] as int,
      name:          this['t_name'] as String,
      description:   this['t_description'] as String,
      amount:        (this['t_amount'] as num).toDouble(),
      date:          DateTime.parse(this['t_date'] as String),
      transactionType: TransactionType.values[(this['t_transactionType'] as int)],
      accountId:     this['t_accountId'] as int?,
      categoryId:    this['t_categoryId'] as int?,
      account: account,
      category: category,
    );
  }
}
