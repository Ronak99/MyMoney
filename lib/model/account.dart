import 'package:floor/floor.dart';

@entity
class Account {
  @primaryKey
  final int id;

  final String name;
  final double balance;
  final DateTime createdOn;

  Account({
    required this.id,
    required this.name,
    required this.balance,
    required this.createdOn,
  });
}
