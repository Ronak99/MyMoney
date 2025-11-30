import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/extensions/list.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/pages/transactions/update/state/update_transaction_state.dart';
import 'package:my_money/presentation/routes/route_generator.dart';

class UpdateTransactionCubit extends Cubit<UpdateTransactionState> {
  Map<TransactionType, TransactionCategory> categoryHistory = {};

  UpdateTransactionCubit({Transaction? transaction})
      : super(
          UpdateTransactionState(
            transaction: transaction ??
                Transaction.empty(
                  account: RouteGenerator.accountCubit.state.accounts.getFirst,
                  category:
                      RouteGenerator.categoryCubit.state.categories.getFirst,
                ),
          ),
        );

  void setNotes(String notes) {
    emit(
      state.copyWith(
        transaction: state.transaction!.copyWith(notes: notes),
      ),
    );
  }

  void setAccount(Account account) {
    emit(
      state.copyWith(
        transaction: state.transaction!.copyWith(
          accountId: account.id,
          account: account,
        ),
      ),
    );
  }

  void setCategory(TransactionCategory category) {
    categoryHistory[state.transactionType] = category;
    emit(
      state.copyWith(
        transaction: state.transaction!.copyWith(
          categoryId: category.id,
          category: category,
        ),
      ),
    );
  }

  void setTransactionType(TransactionType type) {
    if (type == state.transaction!.transactionType) return;
    emit(
      state.copyWith(
        transaction: state.transaction!.copyWith(
          transactionType: type,
        ),
      ),
    );

    TransactionCategory? category;

    if (categoryHistory.containsKey(state.transactionType)) {
      category = categoryHistory[state.transactionType];
    } else {
      final categoryState = RouteGenerator.categoryCubit.state;
      final categories = switch (type) {
        TransactionType.income => categoryState.incomeCategories,
        TransactionType.expense => categoryState.expenseCategories,
        _ => categoryState.categories,
      };
      category = categories.getFirst;
    }

    if (category != null) {
      setCategory(category);
    }
  }

  void setDate(DateTime date) {
    emit(state.copyWith(transaction: state.transaction!.copyWith(date: date)));
  }

  void setTime(TimeOfDay time) {
    emit(
      state.copyWith(
        transaction: state.transaction!.copyWith(
          date: state.transaction!.date.copyWith(
            hour: time.hour,
            minute: time.minute,
          ),
        ),
      ),
    );
  }

  void setAmount(String amount) {
    try {
      emit(
        state.copyWith(
          transaction: state.transaction!.copyWith(
            amount: double.tryParse(amount),
          ),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> create() async {
    RouteGenerator.transactionCubit.addTransaction(state.transaction!);
    return true;
  }

  Future<bool> update() async {
    RouteGenerator.transactionCubit.updateTransaction(state.transaction!);
    return true;
  }
}
