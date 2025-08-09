part of '../storage.dart';

@dao
abstract class _TransactionDao {
  @Query('SELECT * FROM Transaction')
  Stream<List<Transaction>> findAllTransactions();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTransaction(Transaction transaction);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTransaction(Transaction transaction);

  @delete
  Future<void> deleteTransaction(Transaction transaction);

  @Query('SELECT * FROM Transaction WHERE id = :id')
  Future<Transaction?> findTransactionById(int id);

  @Query('SELECT * FROM Transaction WHERE date BETWEEN :startDate AND :endDate')
  Future<List<Transaction>> findTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );
}
