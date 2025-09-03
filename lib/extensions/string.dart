import 'package:my_money/enums/category_icon.dart';

extension StringExtension on String {
  String get capitalizeFirstLetter => this[0].toUpperCase() + substring(1);

  CategoryIcon get convertToCategoryIcon {
    switch (toLowerCase()) {
      case 'dividend':
        return CategoryIcon.dividend;
      case 'friends':
        return CategoryIcon.friends;
      case 'salary':
        return CategoryIcon.salary;
      case 'coupons':
        return CategoryIcon.coupons;
      case 'refunds':
        return CategoryIcon.refunds;
      case 'sale':
        return CategoryIcon.sale;
      case 'bills':
        return CategoryIcon.bills;
      case 'education':
        return CategoryIcon.education;
      case 'entertainment':
        return CategoryIcon.entertainment;
      case 'food':
        return CategoryIcon.food;
      case 'health':
        return CategoryIcon.health;
      case 'home':
        return CategoryIcon.home;
      case 'investments':
        return CategoryIcon.investments;
      case 'shopping':
        return CategoryIcon.shopping;
      case 'sport':
        return CategoryIcon.sport;
      case 'transportation':
        return CategoryIcon.transportation;
      case 'baby':
        return CategoryIcon.baby;
      case 'beauty':
        return CategoryIcon.beauty;
      case 'clothing':
        return CategoryIcon.clothing;
      case 'tax':
        return CategoryIcon.tax;
      case 'electronics':
        return CategoryIcon.electronics;
      case 'insurance':
        return CategoryIcon.insurance;
      default:
        return CategoryIcon.unknown;
    }
  }
}
