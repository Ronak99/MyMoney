part of '../storage.dart';

class LocalStorageService implements _LocalStorageImpl {
  static LocalStorageService? _instance;
  late final _AppDatabase database;

  static LocalStorageService get instance {
    _instance ??= LocalStorageService._();
    return _instance!;
  }

  LocalStorageService._();

  @override
  Future<int> addAccount(Account account) {
    return database.accountDao.insertAccount(account);
  }

  @override
  Future<void> addCategory(TransactionCategory category) {
    return database.categoryDao.insertCategory(category);
  }

  @override
  Future<int> addTransaction(Transaction transaction) {
    return database.transactionDao.insertTransaction(transaction);
  }

  @override
  Stream<List<Transaction>> streamAllTransactions({
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return database.transactionDao.streamAllTransactions(startDate, endDate);
  }

  @override
  Future<void> deleteAccount(Account account) {
    return database.accountDao.deleteAccount(account);
  }

  @override
  Future<void> deleteCategory(TransactionCategory category) {
    return database.categoryDao.deleteCategory(category);
  }

  @override
  Future<void> deleteTransaction(int id) {
    // TODO: implement deleteTransaction
    throw UnimplementedError();
  }

  @override
  Future<Account?> getAccountById(int id) {
    // TODO: implement getAccountById
    throw UnimplementedError();
  }

  @override
  Stream<List<Account>> streamAllAccounts() {
    return database.accountDao.streamAllAccounts();
  }

  @override
  Future<List<TransactionCategory>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<List<Transaction>> getAllTransactions() {
    return database.transactionDao.getAllTransactions();
  }

  @override
  Future<List<TransactionCategory>> getCategoriesByType(CategoryType type) {
    // TODO: implement getCategoriesByType
    throw UnimplementedError();
  }

  @override
  Future<TransactionCategory?> getCategoryById(int id) {
    // TODO: implement getCategoryById
    throw UnimplementedError();
  }

  @override
  Future<double> getTotalBalance() {
    // TODO: implement getTotalBalance
    throw UnimplementedError();
  }

  @override
  Future<Transaction?> getTransactionById(int id) {
    // TODO: implement getTransactionById
    throw UnimplementedError();
  }

  @override
  Future<List<Transaction>> getTransactionsByAccountId(int accountId) {
    // TODO: implement getTransactionsByAccountId
    throw UnimplementedError();
  }

  @override
  Future<List<Transaction>> getTransactionsByCategoryId(int categoryId) {
    // TODO: implement getTransactionsByCategoryId
    throw UnimplementedError();
  }

  @override
  Future<List<Transaction>> getTransactionsByDateRange(
      DateTime startDate, DateTime endDate) {
    // TODO: implement getTransactionsByDateRange
    throw UnimplementedError();
  }

  @override
  Future<void> initialize() async {
    final dbBuilder = $Floor_AppDatabase.databaseBuilder('app_database.db');
    database = await dbBuilder.build();
  }

  @override
  Future<void> updateAccount(Account account) {
    // TODO: implement updateAccount
    throw UnimplementedError();
  }

  @override
  Future<void> updateCategory(TransactionCategory category) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }

  @override
  Future<void> updateTransaction(Transaction transaction) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }

  @override
  Stream<List<TransactionCategory>> streamAllCategories() {
    return database.categoryDao.streamAllCategories();
  }
}
