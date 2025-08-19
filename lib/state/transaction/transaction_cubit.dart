import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_money/enums/date_action.dart';
import 'package:my_money/extensions/date.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/packages/storage/storage.dart';
import 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  StreamSubscription? transactionStream;

  TransactionCubit() : super(TransactionState()) {
    initialize();
  }

  void initialize([DateTime? dateTime]) {
    transactionStream?.cancel();

    emit(state.copyWith(selectedDate: dateTime ?? DateTime.now()));

    final service = Get.find<LocalStorageService>();
    transactionStream = service
        .streamAllTransactions(
      startDate: state.selectedDate!.startOfTheMonth,
      endDate: state.selectedDate!.endOfTheMonth,
    )
        .listen((data) {
      emit(state.copyWith(transactions: data));
    });
  }

  void updateDate({
    required DateAction action,
    DateTime? specificDate,
  }) {
    final DateTime targetDate = switch (action) {
      DateAction.setSpecific => specificDate ?? DateTime.now(),
      DateAction.incrementMonth => state.selectedDate!.nextMonth,
      DateAction.decrementMonth => state.selectedDate!.prevMonth,
    };

    initialize(targetDate);
  }

  void setTransactions(List<Transaction> transactions) {
    emit(state.copyWith(transactions: transactions));
  }

  Future<int> addTransaction(Transaction transaction) {
    try {
      return Get.find<LocalStorageService>().addTransaction(transaction);
    } catch (e) {
      rethrow;
    }
  }
}
