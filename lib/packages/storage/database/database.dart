part of '../storage.dart';

@TypeConverters([_DateTimeConverter])
@Database(version: 1, entities: [Transaction, Account, Category])
abstract class _AppDatabase extends FloorDatabase {
  _TransactionDao get transactionDao;
  _AccountDao get accountDao;
  _CategoryDao get categoryDao;
}
