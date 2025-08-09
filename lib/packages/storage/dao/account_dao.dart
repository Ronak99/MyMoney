part of '../storage.dart';

@dao
abstract class _AccountDao {
  @Query('SELECT * FROM Account WHERE id = :id')
  Future<Account?> findAccountById(int id);

  @Query('SELECT * FROM Account')
  Future<List<Account>> findAllAccounts();

  @insert
  Future<void> insertAccount(Account account);

  @update
  Future<void> updateAccount(Account account);

  @delete
  Future<void> deleteAccount(Account account);
}
