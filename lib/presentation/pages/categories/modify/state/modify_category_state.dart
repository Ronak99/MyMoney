import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_money/model/transaction_category.dart';

part 'modify_category_state.freezed.dart';

@freezed
class ModifyCategoryState with _$ModifyCategoryState {
  factory ModifyCategoryState({
    String? name,
    String? description,
    @Default(CategoryType.expense) CategoryType? type,
    DateTime? createdOn,
  }) = _ModifyCategoryState;
}