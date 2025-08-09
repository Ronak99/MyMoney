import 'package:floor/floor.dart';

@entity
class Account {
  @primaryKey
  final int id;

  final String name;
  final double balance;

  Account({
    required this.id,
    required this.name,
    required this.balance,
  });
}
