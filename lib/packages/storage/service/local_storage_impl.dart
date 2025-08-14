part of '../storage.dart';

abstract class _LocalStorageImpl {
  // Method to initialize the local storage service
  Future<void> initialize();

  // Get all transactions
  Future<List<Transaction>> getAllTransactions();

  // Add a new transaction
  Future<void> addTransaction(Transaction transaction);

  // Update an existing transaction
  Future<void> updateTransaction(Transaction transaction);

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

  // Update an existing account
  Future<void> updateAccount(Account account);

  // Delete an account by ID
  Future<void> deleteAccount(int id);

  // Get an account by ID
  Future<Account?> getAccountById(int id);

  // Get all categories
  Future<List<TransactionCategory>> getAllCategories();

  // Add a new category
  Future<void> addCategory(TransactionCategory category);

  // Update an existing category
  Future<void> updateCategory(TransactionCategory category);

  // Delete a category by ID
  Future<void> deleteCategory(int id);

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
