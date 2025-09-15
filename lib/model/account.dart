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

  // int activeBalance = balance + (sum of transactions.type == income && transactions.account == this) - (sum of transactions.type = expense && transactions.account == this)

  String get formatBalance => balance.formatCurrency;

  Account copyWith({
    int? id,
    String? name,
    int? balance,
    AccountIcon? icon,
    DateTime? createdOn,
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      icon: icon ?? this.icon,
      createdOn: createdOn ?? this.createdOn,
    );
  }
}
