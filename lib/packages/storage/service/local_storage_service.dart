part of '../storage.dart';

class LocalStorageService implements _LocalStorageImpl {
  static LocalStorageService? _instance;

  static LocalStorageService get instance {
    _instance ??= LocalStorageService._();
    return _instance!;
  }

  LocalStorageService._();

  @override
  Future<void> addAccount(Account account) {
    // TODO: implement addAccount
    throw UnimplementedError();
  }

  @override
  Future<void> addCategory(Category category) {
    // TODO: implement addCategory
    throw UnimplementedError();
  }

  @override
  Future<void> addTransaction(Transaction transaction) {
    // TODO: implement addTransaction
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAccount(int id) {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCategory(int id) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
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
  Future<List<Account>> getAllAccounts() {
    // TODO: implement getAllAccounts
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<List<Transaction>> getAllTransactions() {
    // TODO: implement getAllTransactions
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> getCategoriesByType(CategoryType type) {
    // TODO: implement getCategoriesByType
    throw UnimplementedError();
  }

  @override
  Future<Category?> getCategoryById(int id) {
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
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> updateAccount(Account account) {
    // TODO: implement updateAccount
    throw UnimplementedError();
  }

  @override
  Future<void> updateCategory(Category category) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }

  @override
  Future<void> updateTransaction(Transaction transaction) {
    // TODO: implement updateTransaction
    throw UnimplementedError();
  }
}
