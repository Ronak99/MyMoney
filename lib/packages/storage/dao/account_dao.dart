part of '../storage.dart';

@dao
abstract class _AccountDao {
  @Query('SELECT * FROM Account WHERE id = :id')
  Future<Account?> findAccountById(int id);

  @Query('SELECT * FROM Account')
  Future<List<Account>> getAllAccounts();

  @Query('SELECT * FROM Account')
  Stream<List<Account>> streamAllAccounts();

  @insert
  Future<int> insertAccount(Account account);

  @update
  Future<void> updateAccount(Account account);

  @delete
  Future<void> deleteAccount(Account account);
}
