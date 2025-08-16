import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_money/model/transaction_category.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  factory CategoryState({
    @Default([]) List<TransactionCategory> categories,
  }) = _CategoryState;
}
