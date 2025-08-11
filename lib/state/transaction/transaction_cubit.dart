import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/model/transaction.dart';
import 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionState());

  void setTransactions(List<Transaction> transactions) {
    emit(state.copyWith(transactions: transactions));
  }
}
