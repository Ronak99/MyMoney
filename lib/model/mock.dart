import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/model/transaction_category.dart';

class Mock {
  static List<Account> accounts = [
    Account(
      id: 1,
      name: 'Savings Account',
      balance: 15000.75,
      createdOn: DateTime(2023, 3, 12),
    ),
    Account(
      id: 2,
      name: 'Checking Account',
      balance: 5200.50,
      createdOn: DateTime(2022, 7, 25),
    ),
    Account(
      id: 3,
      name: 'Business Account',
      balance: 83000.00,
      createdOn: DateTime(2024, 1, 5),
    ),
  ];

  static List<TransactionCategory> categories = [
    TransactionCategory(
      id: 1,
      name: 'Salary',
      description: 'Monthly salary and other earnings',
      type: CategoryType.income,
      createdOn: DateTime(2023, 5, 1),
    ),
    TransactionCategory(
      id: 2,
      name: 'Groceries',
      description: 'Daily household and food items',
      type: CategoryType.expense,
      createdOn: DateTime(2023, 5, 2),
    ),
    TransactionCategory(
      id: 3,
      name: 'Rent',
      description: 'Monthly house rent payments',
      type: CategoryType.expense,
      createdOn: DateTime(2023, 5, 3),
    ),
    TransactionCategory(
      id: 4,
      name: 'Freelance',
      description: 'Earnings from freelance projects',
      type: CategoryType.income,
      createdOn: DateTime(2023, 5, 4),
    ),
    TransactionCategory(
      id: 5,
      name: 'Utilities',
      description: 'Electricity, water, gas, internet bills',
      type: CategoryType.expense,
      createdOn: DateTime(2023, 5, 5),
    ),
  ];

  static List<Transaction> transactions = [
    Transaction(
      id: 1,
      name: 'April Salary',
      description: 'Salary credited from company',
      amount: 55000.00,
      date: DateTime(2024, 4, 30),
      categoryId: 1,
      accountId: 1,
      transactionType: TransactionType.income,
    ),
    Transaction(
      id: 2,
      name: 'Supermarket',
      description: 'Weekly grocery shopping',
      amount: 3200.50,
      date: DateTime(2024, 5, 2),
      categoryId: 2,
      accountId: 2,
      transactionType: TransactionType.expense,
    ),
    Transaction(
      id: 3,
      name: 'May Rent',
      description: 'House rent paid to landlord',
      amount: 15000.00,
      date: DateTime(2024, 5, 3),
      categoryId: 3,
      accountId: 1,
      transactionType: TransactionType.expense,
    ),
    Transaction(
      id: 4,
      name: 'Website Development',
      description: 'Freelance project payment',
      amount: 25000.00,
      date: DateTime(2024, 5, 10),
      categoryId: 4,
      accountId: 3,
      transactionType: TransactionType.income,
    ),
    Transaction(
      id: 5,
      name: 'Electricity Bill',
      description: 'Monthly electricity bill payment',
      amount: 2300.75,
      date: DateTime(2024, 5, 15),
      categoryId: 5,
      accountId: 2,
      transactionType: TransactionType.expense,
    ),
    Transaction(
      id: 6,
      name: 'Bonus',
      description: 'Annual performance bonus',
      amount: 12000.00,
      date: DateTime(2024, 5, 20),
      categoryId: 1,
      accountId: 1,
      transactionType: TransactionType.income,
    ),
  ];
}
