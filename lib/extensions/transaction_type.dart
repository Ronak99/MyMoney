import 'package:my_money/enums/category_type.dart';
import 'package:my_money/model/transaction.dart';

extension TransactionTypeExtension on TransactionType {
  CategoryType get toCategoryType => switch(this) {
    TransactionType.income => CategoryType.income,
    _ => CategoryType.expense,
  };
}