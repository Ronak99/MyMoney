import 'package:floor/floor.dart';

enum CategoryType {
  income,
  expense,
}

@Entity(tableName: 'categories')
class TransactionCategory {
  @primaryKey
  final int? id;

  final String name;
  final CategoryType type;
  final DateTime createdOn;

  TransactionCategory({
    this.id,
    required this.name,
    required this.type,
    required this.createdOn,
  });

  factory TransactionCategory.unknown() {
    return TransactionCategory(
        name: 'unknown',
        type: CategoryType.expense,
        createdOn: DateTime.now());
  }

  factory TransactionCategory.dividend() {
    return TransactionCategory(
      name: 'Dividend',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
    );
  }
}
