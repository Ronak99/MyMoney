import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_money/enums/category_type.dart';
import 'package:my_money/model/transaction_category.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  CategoryState._();

  factory CategoryState({
    @Default([]) List<TransactionCategory> categories,
  }) = _CategoryState;

  List<TransactionCategory> get incomeCategories => categories.where((t) => t.type == CategoryType.income).toList();

  List<TransactionCategory> get expenseCategories => categories.where((t) => t.type == CategoryType.expense).toList();
}
