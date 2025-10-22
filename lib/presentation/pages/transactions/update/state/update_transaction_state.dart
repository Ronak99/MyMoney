import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/model/transaction_category.dart';

part 'update_transaction_state.freezed.dart';

@freezed
class UpdateTransactionState with _$UpdateTransactionState {
  const UpdateTransactionState._();

  factory UpdateTransactionState({
    @Default(null) Transaction? transaction,
  }) = _UpdateTransactionState;

  bool get isValid => transaction!= null &&
      transaction!.amount > 0 &&
      transaction!.category != null &&
      transaction!.account != null;

  TransactionCategory? get category => transaction!.category;
  Account? get account => transaction!.account;
  DateTime? get date => transaction!.date;
  TransactionType? get transactionType => transaction!.transactionType;
}
