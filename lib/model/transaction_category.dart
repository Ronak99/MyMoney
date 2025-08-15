import 'package:floor/floor.dart';

enum CategoryType {
  income,
  expense,
}

@Entity(tableName: 'categories')
class TransactionCategory {
  @primaryKey
  final int id;

  final String name;
  final String description;
  final CategoryType type;
  final DateTime createdOn;

  TransactionCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.createdOn,
  });
}
