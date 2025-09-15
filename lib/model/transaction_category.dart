import 'package:floor/floor.dart';
import 'package:my_money/enums/category_icon.dart';
import 'package:my_money/enums/category_type.dart';

@Entity(tableName: 'categories')
class TransactionCategory {
  @primaryKey
  final int? id;

  final String name;
  final CategoryType type;
  final DateTime createdOn;
  final CategoryIcon icon;

  TransactionCategory({
    this.id,
    required this.name,
    required this.type,
    required this.createdOn,
    required this.icon,
  });

  TransactionCategory copyWith({
    int? id,
    String? name,
    CategoryType? type,
    DateTime? createdOn,
    CategoryIcon? icon,
  }) {
    return TransactionCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      createdOn: createdOn ?? this.createdOn,
      icon: icon ?? this.icon,
    );
  }

  factory TransactionCategory.dividend() {
    return TransactionCategory(
      name: 'Dividend',
      type: CategoryType.income,
      createdOn: DateTime.now(),
      icon: CategoryIcon.dividend,
    );
  }

  factory TransactionCategory.friends() {
    return TransactionCategory(
      name: 'Friends',
      type: CategoryType.income,
      createdOn: DateTime.now(),
      icon: CategoryIcon.friends,
    );
  }

  factory TransactionCategory.salary() {
    return TransactionCategory(
      name: 'Salary',
      type: CategoryType.income,
      createdOn: DateTime.now(),
      icon: CategoryIcon.salary,
    );
  }

  factory TransactionCategory.coupons() {
    return TransactionCategory(
      name: 'Coupons',
      type: CategoryType.income,
      createdOn: DateTime.now(),
      icon: CategoryIcon.coupons,
    );
  }

  factory TransactionCategory.refunds() {
    return TransactionCategory(
      name: 'Refunds',
      type: CategoryType.income,
      createdOn: DateTime.now(),
      icon: CategoryIcon.refunds,
    );
  }

  factory TransactionCategory.sale() {
    return TransactionCategory(
      name: 'Sale',
      type: CategoryType.income,
      createdOn: DateTime.now(),
      icon: CategoryIcon.sale,
    );
  }

  // Expense category factory constructors
  factory TransactionCategory.bills() {
    return TransactionCategory(
      name: 'Bills',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.bills,
    );
  }

  factory TransactionCategory.education() {
    return TransactionCategory(
      name: 'Education',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.education,
    );
  }

  factory TransactionCategory.entertainment() {
    return TransactionCategory(
      name: 'Entertainment',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.entertainment,
    );
  }

  factory TransactionCategory.food() {
    return TransactionCategory(
      name: 'Food',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.food,
    );
  }

  factory TransactionCategory.health() {
    return TransactionCategory(
      name: 'Health',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.health,
    );
  }

  factory TransactionCategory.home() {
    return TransactionCategory(
      name: 'Home Hygiene',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.home,
    );
  }

  factory TransactionCategory.investments() {
    return TransactionCategory(
      name: 'Investments',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.investments,
    );
  }

  factory TransactionCategory.shopping() {
    return TransactionCategory(
      name: 'Shopping',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.shopping,
    );
  }

  factory TransactionCategory.sport() {
    return TransactionCategory(
      name: 'Sport',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.sport,
    );
  }

  factory TransactionCategory.transportation() {
    return TransactionCategory(
      name: 'Transportation',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.transportation,
    );
  }

  factory TransactionCategory.baby() {
    return TransactionCategory(
      name: 'Baby',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.baby,
    );
  }

  factory TransactionCategory.beauty() {
    return TransactionCategory(
      name: 'Beauty',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.beauty,
    );
  }

  factory TransactionCategory.clothing() {
    return TransactionCategory(
      name: 'Clothing',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.clothing,
    );
  }

  factory TransactionCategory.electronics() {
    return TransactionCategory(
      name: 'Electronics',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.electronics,
    );
  }

  factory TransactionCategory.insurance() {
    return TransactionCategory(
      name: 'Insurance',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.insurance,
    );
  }

  factory TransactionCategory.tax() {
    return TransactionCategory(
      name: 'Tax',
      type: CategoryType.expense,
      createdOn: DateTime.now(),
      icon: CategoryIcon.tax,
    );
  }
}
