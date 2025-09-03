import 'package:my_money/enums/category_type.dart';
import 'package:my_money/model/transaction_category.dart';

extension CategoriesExtension on List<TransactionCategory> {
  Map<CategoryType, List<TransactionCategory>> get groupByType {
    Map<CategoryType, List<TransactionCategory>> map = {};

    forEach((category) {
      if (map.containsKey(category.type)) {
        map[category.type]!.add(category);
      } else {
        map[category.type] = [category];
      }
    });

    return map;
  }
}
