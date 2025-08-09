part of '../storage.dart';

@Database(version: 1, entities: [Transaction, Account, Category])
abstract class AppDatabase extends FloorDatabase {
  _TransactionDao get transactionDao;
  _AccountDao get accountDao;
  _CategoryDao get categoryDao;
}
