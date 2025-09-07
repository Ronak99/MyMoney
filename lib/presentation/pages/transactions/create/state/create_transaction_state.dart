import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/model/transaction_category.dart';

part 'create_transaction_state.freezed.dart';

@freezed
class CreateTransactionState with _$CreateTransactionState {
  const CreateTransactionState._();

  factory CreateTransactionState({
    @Default(null) Transaction? transaction,
  }) = _CreateTransactionState;

  bool get isValid => transaction!= null &&
      transaction!.amount > 0 &&
      transaction!.category != null &&
      transaction!.account != null;

  TransactionCategory? get category => transaction!.category;
  Account? get account => transaction!.account;
  DateTime? get date => transaction!.date;
  TransactionType? get transactionType => transaction!.transactionType;
}
