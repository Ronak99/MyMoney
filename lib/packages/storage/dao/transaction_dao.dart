part of '../storage.dart';

@dao
abstract class _TransactionDao {
  static const String tableName = 'transactions';

  @Query('SELECT * FROM ${DBViews.transactionWithCategoryAndAccount}')
  Future<List<TransactionWithCategoryAndAccountView>>
      getTransactionsWithCategoryAndView();

  @Query(
      'SELECT * FROM ${DBViews.transactionWithCategoryAndAccount} WHERE t_date BETWEEN :startDate AND :endDate')
  Stream<List<TransactionWithCategoryAndAccountView>>
      streamTransactionsWithCategoryAndView(int startDate, int endDate);

  @Query('SELECT * FROM ${DBViews.transactionWithCategoryAndAccount}')
  Stream<List<Transaction>> streamAllTransactions(
    DateTime startDate,
    DateTime endDate,
  );

  // Stream<List<Transaction>> streamAllTransactions(
  //     DateTime startDate,
  //     DateTime endDate,
  //     ) {
  //   return streamTransactionsWithCategoryAndView(
  //     startDate.millisecondsSinceEpoch,
  //     endDate.millisecondsSinceEpoch,
  //   ).map((viewList) {
  //     return viewList.map((r) {
  //       final account = r.toAccount();
  //       final category = r.toCategory();
  //       return r.toTransaction(account: account, category: category);
  //     }).toList();
  //   });
  // }

  Future<List<Transaction>> getAllTransactions() async {
    final transactionView = await getTransactionsWithCategoryAndView();
    return transactionView.map((r) {
      Account? account = r.toAccount();
      TransactionCategory? category = r.toCategory();
      return r.toTransaction(account: account, category: category);
    }).toList();
  }

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertTransaction(Transaction transaction);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTransaction(Transaction transaction);

  @delete
  Future<void> deleteTransaction(Transaction transaction);

  @Query('SELECT * FROM $tableName WHERE id = :id')
  Future<Transaction?> findTransactionById(int id);

  @Query('SELECT * FROM $tableName WHERE date BETWEEN :startDate AND :endDate')
  Future<List<Transaction>> findTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );
}
