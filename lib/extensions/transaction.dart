import 'package:flutter/material.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/extensions/double.dart';
import 'package:my_money/model/transaction.dart';

extension TransactionExtension on Transaction {
  String get formattedAmount => "${transactionType == TransactionType.expense ? "-" : ""} ${amount.formatCurrency}";

  Color amountForegroundColor(BuildContext context) => switch (transactionType) {
    TransactionType.transfer => context.colorScheme.primary,
    TransactionType.income => context.colorScheme.tertiary,
    _ => context.colorScheme.error,
  };

  bool get isExpense => transactionType == TransactionType.expense;

  double get signedAmount => isExpense ? amount * -1 : amount;
}