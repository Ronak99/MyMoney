import 'package:floor/floor.dart';

enum CategoryType {
  income,
  expense,
}

@entity
class Category {
  @primaryKey
  final int id;

  final String name;
  final String description;
  final CategoryType type;
  final DateTime createdOn;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.createdOn,
  });
}
