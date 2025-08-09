// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $_AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $_AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $_AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<_AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $Floor_AppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $_AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$_AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $_AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$_AppDatabaseBuilder(null);
}

class _$_AppDatabaseBuilder implements $_AppDatabaseBuilderContract {
  _$_AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $_AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $_AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<_AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$_AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$_AppDatabase extends _AppDatabase {
  _$_AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  _TransactionDao? _transactionDaoInstance;

  _AccountDao? _accountDaoInstance;

  _CategoryDao? _categoryDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `transactions` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `amount` REAL NOT NULL, `date` INTEGER NOT NULL, `categoryId` TEXT NOT NULL, `accountId` TEXT NOT NULL, FOREIGN KEY (`categoryId`) REFERENCES `Category` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`accountId`) REFERENCES `Account` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Account` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `balance` REAL NOT NULL, `createdOn` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Category` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `type` INTEGER NOT NULL, `createdOn` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  _TransactionDao get transactionDao {
    return _transactionDaoInstance ??=
        _$_TransactionDao(database, changeListener);
  }

  @override
  _AccountDao get accountDao {
    return _accountDaoInstance ??= _$_AccountDao(database, changeListener);
  }

  @override
  _CategoryDao get categoryDao {
    return _categoryDaoInstance ??= _$_CategoryDao(database, changeListener);
  }
}

class _$_TransactionDao extends _TransactionDao {
  _$_TransactionDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _transactionInsertionAdapter = InsertionAdapter(
            database,
            'transactions',
            (Transaction item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'amount': item.amount,
                  'date': __DateTimeConverter.encode(item.date),
                  'categoryId': item.categoryId,
                  'accountId': item.accountId
                },
            changeListener),
        _transactionUpdateAdapter = UpdateAdapter(
            database,
            'transactions',
            ['id'],
            (Transaction item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'amount': item.amount,
                  'date': __DateTimeConverter.encode(item.date),
                  'categoryId': item.categoryId,
                  'accountId': item.accountId
                },
            changeListener),
        _transactionDeletionAdapter = DeletionAdapter(
            database,
            'transactions',
            ['id'],
            (Transaction item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'amount': item.amount,
                  'date': __DateTimeConverter.encode(item.date),
                  'categoryId': item.categoryId,
                  'accountId': item.accountId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Transaction> _transactionInsertionAdapter;

  final UpdateAdapter<Transaction> _transactionUpdateAdapter;

  final DeletionAdapter<Transaction> _transactionDeletionAdapter;

  @override
  Stream<List<Transaction>> findAllTransactions() {
    return _queryAdapter.queryListStream('SELECT * FROM Transaction',
        mapper: (Map<String, Object?> row) => Transaction(
            id: row['id'] as int,
            description: row['description'] as String,
            name: row['name'] as String,
            amount: row['amount'] as double,
            date: __DateTimeConverter.decode(row['date'] as int),
            categoryId: row['categoryId'] as String,
            accountId: row['accountId'] as String),
        queryableName: 'Transaction',
        isView: false);
  }

  @override
  Future<Transaction?> findTransactionById(int id) async {
    return _queryAdapter.query('SELECT * FROM Transaction WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Transaction(
            id: row['id'] as int,
            description: row['description'] as String,
            name: row['name'] as String,
            amount: row['amount'] as double,
            date: __DateTimeConverter.decode(row['date'] as int),
            categoryId: row['categoryId'] as String,
            accountId: row['accountId'] as String),
        arguments: [id]);
  }

  @override
  Future<List<Transaction>> findTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Transaction WHERE date BETWEEN ?1 AND ?2',
        mapper: (Map<String, Object?> row) => Transaction(
            id: row['id'] as int,
            description: row['description'] as String,
            name: row['name'] as String,
            amount: row['amount'] as double,
            date: __DateTimeConverter.decode(row['date'] as int),
            categoryId: row['categoryId'] as String,
            accountId: row['accountId'] as String),
        arguments: [
          __DateTimeConverter.encode(startDate),
          __DateTimeConverter.encode(endDate)
        ]);
  }

  @override
  Future<void> insertTransaction(Transaction transaction) async {
    await _transactionInsertionAdapter.insert(
        transaction, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateTransaction(Transaction transaction) async {
    await _transactionUpdateAdapter.update(
        transaction, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteTransaction(Transaction transaction) async {
    await _transactionDeletionAdapter.delete(transaction);
  }
}

class _$_AccountDao extends _AccountDao {
  _$_AccountDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _accountInsertionAdapter = InsertionAdapter(
            database,
            'Account',
            (Account item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'balance': item.balance,
                  'createdOn': __DateTimeConverter.encode(item.createdOn)
                }),
        _accountUpdateAdapter = UpdateAdapter(
            database,
            'Account',
            ['id'],
            (Account item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'balance': item.balance,
                  'createdOn': __DateTimeConverter.encode(item.createdOn)
                }),
        _accountDeletionAdapter = DeletionAdapter(
            database,
            'Account',
            ['id'],
            (Account item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'balance': item.balance,
                  'createdOn': __DateTimeConverter.encode(item.createdOn)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Account> _accountInsertionAdapter;

  final UpdateAdapter<Account> _accountUpdateAdapter;

  final DeletionAdapter<Account> _accountDeletionAdapter;

  @override
  Future<Account?> findAccountById(int id) async {
    return _queryAdapter.query('SELECT * FROM Account WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Account(
            id: row['id'] as int,
            name: row['name'] as String,
            balance: row['balance'] as double,
            createdOn: __DateTimeConverter.decode(row['createdOn'] as int)),
        arguments: [id]);
  }

  @override
  Future<List<Account>> findAllAccounts() async {
    return _queryAdapter.queryList('SELECT * FROM Account',
        mapper: (Map<String, Object?> row) => Account(
            id: row['id'] as int,
            name: row['name'] as String,
            balance: row['balance'] as double,
            createdOn: __DateTimeConverter.decode(row['createdOn'] as int)));
  }

  @override
  Future<void> insertAccount(Account account) async {
    await _accountInsertionAdapter.insert(account, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateAccount(Account account) async {
    await _accountUpdateAdapter.update(account, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteAccount(Account account) async {
    await _accountDeletionAdapter.delete(account);
  }
}

class _$_CategoryDao extends _CategoryDao {
  _$_CategoryDao(
    this.database,
    this.changeListener,
  ) : _queryAdapter = QueryAdapter(database);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  @override
  Future<Category?> findCategoryById(int id) async {
    return _queryAdapter.query('SELECT * FROM Category WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Category(
            id: row['id'] as int,
            name: row['name'] as String,
            description: row['description'] as String,
            type: CategoryType.values[row['type'] as int],
            createdOn: __DateTimeConverter.decode(row['createdOn'] as int)),
        arguments: [id]);
  }

  @override
  Future<List<Category>> findAllCategories() async {
    return _queryAdapter.queryList('SELECT * FROM Category',
        mapper: (Map<String, Object?> row) => Category(
            id: row['id'] as int,
            name: row['name'] as String,
            description: row['description'] as String,
            type: CategoryType.values[row['type'] as int],
            createdOn: __DateTimeConverter.decode(row['createdOn'] as int)));
  }
}

// ignore_for_file: unused_element
final __DateTimeConverter = _DateTimeConverter();
