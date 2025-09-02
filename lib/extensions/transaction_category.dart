import 'package:my_money/model/transaction_category.dart';

extension TransactionCategoryDefaults on TransactionCategory {
  static List<TransactionCategory> get allIncomeCategories => [
    TransactionCategory.dividend(),
    TransactionCategory.friends(),
    TransactionCategory.salary(),
    TransactionCategory.refunds(),
    TransactionCategory.sale(),
  ];

  static List<TransactionCategory> get allExpenseCategories => [
    TransactionCategory.bills(),
    TransactionCategory.education(),
    TransactionCategory.entertainment(),
    TransactionCategory.food(),
    TransactionCategory.health(),
    TransactionCategory.investments(),
    TransactionCategory.shopping(),
    TransactionCategory.sport(),
    TransactionCategory.transportation(),
    TransactionCategory.baby(),
    TransactionCategory.beauty(),
    TransactionCategory.clothing(),
    TransactionCategory.electronics(),
    TransactionCategory.insurance(),
    TransactionCategory.tax(),
  ];

  static List<TransactionCategory> get allCategories => [
    ...allIncomeCategories,
    ...allExpenseCategories,
  ];
}