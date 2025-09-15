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

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertAccount(Account account);

  @delete
  Future<void> deleteAccount(Account account);
}
