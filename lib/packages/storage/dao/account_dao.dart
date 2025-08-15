part of '../storage.dart';

@dao
abstract class _AccountDao {
  static const String tableName = 'accounts';

  @Query('SELECT * FROM $tableName WHERE id = :id')
  Future<Account?> findAccountById(int id);

  @Query('SELECT * FROM $tableName')
  Future<List<Account>> getAllAccounts();

  @Query('SELECT * FROM $tableName')
  Stream<List<Account>> streamAllAccounts();

  @insert
  Future<int> insertAccount(Account account);

  @update
  Future<void> updateAccount(Account account);

  @delete
  Future<void> deleteAccount(Account account);
}
