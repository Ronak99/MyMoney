import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_state.dart';
import 'package:my_money/presentation/routes/route_generator.dart';

class CreateTransactionCubit extends Cubit<CreateTransactionState> {
  CreateTransactionCubit({
    String? name,
    String? description,
    Account? account,
    TransactionCategory? category,
    TransactionType? transactionType,
    DateTime? date,
    double? amount,
  }) : super(CreateTransactionState(
          name: name,
          description: description,
          account: account,
          category: category,
          transactionType: transactionType,
          date: DateTime.now(),
          amount: amount,
        ));

  void setName(String name) {
    emit(state.copyWith(name: name));
  }

  void setDescription(String description) {
    emit(state.copyWith(description: description));
  }

  void setAccount(Account account) {
    emit(state.copyWith(account: account));
  }

  void setCategory(TransactionCategory category) {
    emit(state.copyWith(category: category));
  }

  void setTransactionType(TransactionType type) {
    emit(state.copyWith(transactionType: type));
  }

  void setDate(DateTime date) {
    emit(state.copyWith(date: date));
  }

  void setTime(TimeOfDay time) {
    emit(
      state.copyWith(
        date: state.date!.copyWith(
          hour: time.hour,
          minute: time.minute,
        ),
      ),
    );
  }

  void setAmount(String amount) {
    try {
      emit(state.copyWith(amount: double.tryParse(amount)));
    } catch (e) {
      rethrow;
    }
  }

  void create() {
    Transaction transaction = Transaction(
      name: state.name!,
      description: state.description!,
      amount: state.amount!,
      date: state.date!,
      transactionType: state.transactionType!,
      accountId: state.account?.id,
      categoryId: state.category?.id,
    );

    RouteGenerator.transactionCubit.addTransaction(transaction);
  }
}
