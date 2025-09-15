part of '../storage.dart';

abstract class _LocalStorageImpl {
  // Method to initialize the local storage service
  Future<void> initialize();

  // Get all transactions
  Future<List<Transaction>> getAllTransactions();

  // Stream all transactions
  Stream<List<Transaction>> streamAllTransactions({
    required DateTime startDate,
    required DateTime endDate,
  });

  // Add a new transaction
  Future<void> addTransaction(Transaction transaction);

  // Delete a transaction by ID
  Future<void> deleteTransaction(int id);

  // Get a transaction by ID
  Future<Transaction?> getTransactionById(int id);

  // Get all transactions within a particular date range
  Future<List<Transaction>> getTransactionsByDateRange(
      DateTime startDate, DateTime endDate);

  // Get all accounts
  Stream<List<Account>> streamAllAccounts();

  // Add a new account
  Future<int> addAccount(Account account);

  Future<void> deleteAccount(Account account);

  // Get an account by ID
  Future<Account?> getAccountById(int id);

  // Get all categories
  Future<List<TransactionCategory>> getAllCategories();

  // Get all accounts
  Stream<List<TransactionCategory>> streamAllCategories();

  // Add a new category
  Future<void> addCategory(TransactionCategory category);

  // Delete a category by ID
  Future<void> deleteCategory(TransactionCategory category);

  // Get a category by ID
  Future<TransactionCategory?> getCategoryById(int id);

  // Get all categories by type
  Future<List<TransactionCategory>> getCategoriesByType(CategoryType type);

  // Get all transactions for a specific account
  Future<List<Transaction>> getTransactionsByAccountId(int accountId);

  // Get all transactions for a specific category
  Future<List<Transaction>> getTransactionsByCategoryId(int categoryId);

  // Get the total balance of all accounts
  Future<double> getTotalBalance();
}
