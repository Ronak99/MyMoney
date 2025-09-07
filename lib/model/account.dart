import 'package:floor/floor.dart';
import 'package:my_money/enums/account_icon.dart';
import 'package:my_money/extensions/double.dart';

@Entity(tableName: 'accounts')
class Account {
  @primaryKey
  final int? id;

  final String name;
  final int balance;
  final DateTime createdOn;
  final AccountIcon icon;

  Account({
    this.id,
    required this.name,
    required this.balance,
    required this.createdOn,
    required this.icon,
  });

  String get formatBalance => balance.formatCurrency;
}
