import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/model/transaction_category.dart';

part 'create_transaction_state.freezed.dart';

@freezed
class CreateTransactionState with _$CreateTransactionState {
  factory CreateTransactionState({
    @Default(TransactionType.expense) TransactionType? transactionType,
    Account? account,
    TransactionCategory? category,
    String? name,
    String? description,
    double? amount,
    @Default(DateTime.now) date,
  }) = _CreateTransactionState;
}