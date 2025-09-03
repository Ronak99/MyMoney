import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_money/enums/category_icon.dart';
import 'package:my_money/enums/category_type.dart';

part 'modify_category_state.freezed.dart';

@freezed
class ModifyCategoryState with _$ModifyCategoryState {
  factory ModifyCategoryState({
    String? name,
    @Default(CategoryType.expense) CategoryType? type,
    DateTime? createdOn,
    CategoryIcon? icon,
  }) = _ModifyCategoryState;
}