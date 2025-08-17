import 'package:floor/floor.dart';

@Entity(tableName: 'accounts')
class Account {
  @primaryKey
  final int? id;

  final String name;
  final double balance;
  final DateTime createdOn;

  Account({
    this.id,
    required this.name,
    required this.balance,
    required this.createdOn,
  });
}
