import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_money/model/transaction.dart';

part 'transaction_state.freezed.dart';

@freezed
class TransactionState with _$TransactionState {
  factory TransactionState({
    @Default([]) List<Transaction> transactions,
  }) = _TransactionState;
}
