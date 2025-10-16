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
            'CREATE TABLE IF NOT EXISTS `transactions` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `notes` TEXT NOT NULL, `amount` REAL NOT NULL, `date` INTEGER NOT NULL, `categoryId` INTEGER, `accountId` INTEGER, `transactionType` INTEGER NOT NULL, FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE, FOREIGN KEY (`accountId`) REFERENCES `accounts` (`id`) ON UPDATE NO ACTION ON DELETE CASCADE)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `accounts` (`id` INTEGER, `name` TEXT NOT NULL, `balance` INTEGER NOT NULL, `createdOn` INTEGER NOT NULL, `icon` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `categories` (`id` INTEGER, `name` TEXT NOT NULL, `type` INTEGER NOT NULL, `createdOn` INTEGER NOT NULL, `icon` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE INDEX `idx_transactions_date` ON `transactions` (`date`)');
        await database.execute(
            'CREATE INDEX `idx_transactions_account` ON `transactions` (`accountId`)');
        await database.execute(
            'CREATE INDEX `idx_transactions_category` ON `transactions` (`categoryId`)');
        await database.execute(
            'CREATE VIEW IF NOT EXISTS `transaction_with_category_and_account` AS   SELECT\n    t.id                AS t_id,\n    t.notes              AS t_notes,\n    t.amount            AS t_amount,\n    t.date              AS t_date,\n    t.transactionType   AS t_transactionType,\n    t.accountId         AS t_accountId,\n    t.categoryId        AS t_categoryId,\n\n    a.id                AS a_id,\n    a.name              AS a_name,\n    a.balance           AS a_balance,\n    a.createdOn         AS a_createdOn,\n\n    c.id                AS c_id,\n    c.name              AS c_name,\n    c.icon              AS c_icon,\n    c.type              AS c_type,\n    c.createdOn         AS c_createdOn\n  FROM transactions t\n  LEFT JOIN accounts  a ON a.id = t.accountId\n  LEFT JOIN categories c ON c.id = t.categoryId\n  ');

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
                  'notes': item.notes,
                  'amount': item.amount,
                  'date': __DateTimeConverter.encode(item.date),
                  'categoryId': item.categoryId,
                  'accountId': item.accountId,
                  'transactionType': item.transactionType.index
                },
            changeListener),
        _transactionDeletionAdapter = DeletionAdapter(
            database,
            'transactions',
            ['id'],
            (Transaction item) => <String, Object?>{
                  'id': item.id,
                  'notes': item.notes,
                  'amount': item.amount,
                  'date': __DateTimeConverter.encode(item.date),
                  'categoryId': item.categoryId,
                  'accountId': item.accountId,
                  'transactionType': item.transactionType.index
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Transaction> _transactionInsertionAdapter;

  final DeletionAdapter<Transaction> _transactionDeletionAdapter;

  @override
  Future<List<TransactionWithCategoryAndAccountView>>
      getTransactionsWithCategoryAndView() async {
    return _queryAdapter.queryList(
        'SELECT * FROM transaction_with_category_and_account',
        mapper: (Map<String, Object?> row) =>
            TransactionWithCategoryAndAccountView(
                t_id: row['t_id'] as int,
                t_notes: row['t_notes'] as String,
                t_amount: row['t_amount'] as double,
                t_date: row['t_date'] as int,
                t_transactionType: row['t_transactionType'] as int,
                t_accountId: row['t_accountId'] as int?,
                t_categoryId: row['t_categoryId'] as int?,
                a_id: row['a_id'] as int?,
                a_name: row['a_name'] as String?,
                a_icon: row['a_icon'] as int?,
                a_balance: row['a_balance'] as int?,
                a_createdOn: row['a_createdOn'] as int?,
                c_id: row['c_id'] as int?,
                c_name: row['c_name'] as String?,
                c_icon: row['c_icon'] as int?,
                c_type: row['c_type'] as int?,
                c_createdOn: row['c_createdOn'] as int?));
  }

  @override
  Stream<List<TransactionWithCategoryAndAccountView>>
      streamTransactionsWithCategoryAndView(
    int startDate,
    int endDate,
  ) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM transaction_with_category_and_account WHERE t_date BETWEEN ?1 AND ?2 ORDER BY t_date DESC',
        mapper: (Map<String, Object?> row) =>
            TransactionWithCategoryAndAccountView(
                t_id: row['t_id'] as int,
                t_notes: row['t_notes'] as String,
                t_amount: row['t_amount'] as double,
                t_date: row['t_date'] as int,
                t_transactionType: row['t_transactionType'] as int,
                t_accountId: row['t_accountId'] as int?,
                t_categoryId: row['t_categoryId'] as int?,
                a_id: row['a_id'] as int?,
                a_name: row['a_name'] as String?,
                a_icon: row['a_icon'] as int?,
                a_balance: row['a_balance'] as int?,
                a_createdOn: row['a_createdOn'] as int?,
                c_id: row['c_id'] as int?,
                c_name: row['c_name'] as String?,
                c_icon: row['c_icon'] as int?,
                c_type: row['c_type'] as int?,
                c_createdOn: row['c_createdOn'] as int?),
        arguments: [startDate, endDate],
        queryableName: 'transaction_with_category_and_account',
        isView: true);
  }

  @override
  Future<void> deleteAllTransactions() async {
    await _queryAdapter.queryNoReturn('DELETE FROM transactions');
  }

  @override
  Future<Transaction?> findTransactionById(int id) async {
    return _queryAdapter.query('SELECT * FROM transactions WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Transaction(
            id: row['id'] as int?,
            notes: row['notes'] as String,
            amount: row['amount'] as double,
            date: __DateTimeConverter.decode(row['date'] as int),
            transactionType:
                TransactionType.values[row['transactionType'] as int],
            categoryId: row['categoryId'] as int?,
            accountId: row['accountId'] as int?),
        arguments: [id]);
  }

  @override
  Future<List<Transaction>> findTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM transactions WHERE date BETWEEN ?1 AND ?2',
        mapper: (Map<String, Object?> row) => Transaction(
            id: row['id'] as int?,
            notes: row['notes'] as String,
            amount: row['amount'] as double,
            date: __DateTimeConverter.decode(row['date'] as int),
            transactionType:
                TransactionType.values[row['transactionType'] as int],
            categoryId: row['categoryId'] as int?,
            accountId: row['accountId'] as int?),
        arguments: [
          __DateTimeConverter.encode(startDate),
          __DateTimeConverter.encode(endDate)
        ]);
  }

  @override
  Future<int> insertTransaction(Transaction transaction) {
    return _transactionInsertionAdapter.insertAndReturnId(
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
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _accountInsertionAdapter = InsertionAdapter(
            database,
            'accounts',
            (Account item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'balance': item.balance,
                  'createdOn': __DateTimeConverter.encode(item.createdOn),
                  'icon': item.icon.index
                },
            changeListener),
        _accountDeletionAdapter = DeletionAdapter(
            database,
            'accounts',
            ['id'],
            (Account item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'balance': item.balance,
                  'createdOn': __DateTimeConverter.encode(item.createdOn),
                  'icon': item.icon.index
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Account> _accountInsertionAdapter;

  final DeletionAdapter<Account> _accountDeletionAdapter;

  @override
  Future<Account?> findAccountById(int id) async {
    return _queryAdapter.query('SELECT * FROM accounts WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Account(
            id: row['id'] as int?,
            name: row['name'] as String,
            balance: row['balance'] as int,
            createdOn: __DateTimeConverter.decode(row['createdOn'] as int),
            icon: AccountIcon.values[row['icon'] as int]),
        arguments: [id]);
  }

  @override
  Future<List<Account>> getAllAccounts() async {
    return _queryAdapter.queryList('SELECT * FROM accounts',
        mapper: (Map<String, Object?> row) => Account(
            id: row['id'] as int?,
            name: row['name'] as String,
            balance: row['balance'] as int,
            createdOn: __DateTimeConverter.decode(row['createdOn'] as int),
            icon: AccountIcon.values[row['icon'] as int]));
  }

  @override
  Stream<List<Account>> streamAllAccounts() {
    return _queryAdapter.queryListStream('SELECT * FROM accounts',
        mapper: (Map<String, Object?> row) => Account(
            id: row['id'] as int?,
            name: row['name'] as String,
            balance: row['balance'] as int,
            createdOn: __DateTimeConverter.decode(row['createdOn'] as int),
            icon: AccountIcon.values[row['icon'] as int]),
        queryableName: 'accounts',
        isView: false);
  }

  @override
  Future<int> insertAccount(Account account) {
    return _accountInsertionAdapter.insertAndReturnId(
        account, OnConflictStrategy.replace);
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
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _transactionCategoryInsertionAdapter = InsertionAdapter(
            database,
            'categories',
            (TransactionCategory item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'type': item.type.index,
                  'createdOn': __DateTimeConverter.encode(item.createdOn),
                  'icon': item.icon.index
                },
            changeListener),
        _transactionCategoryDeletionAdapter = DeletionAdapter(
            database,
            'categories',
            ['id'],
            (TransactionCategory item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'type': item.type.index,
                  'createdOn': __DateTimeConverter.encode(item.createdOn),
                  'icon': item.icon.index
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TransactionCategory>
      _transactionCategoryInsertionAdapter;

  final DeletionAdapter<TransactionCategory>
      _transactionCategoryDeletionAdapter;

  @override
  Stream<List<TransactionCategory>> streamAllCategories() {
    return _queryAdapter.queryListStream('SELECT * FROM categories',
        mapper: (Map<String, Object?> row) => TransactionCategory(
            id: row['id'] as int?,
            name: row['name'] as String,
            type: CategoryType.values[row['type'] as int],
            createdOn: __DateTimeConverter.decode(row['createdOn'] as int),
            icon: CategoryIcon.values[row['icon'] as int]),
        queryableName: 'categories',
        isView: false);
  }

  @override
  Future<TransactionCategory?> findCategoryById(int id) async {
    return _queryAdapter.query('SELECT * FROM categories WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TransactionCategory(
            id: row['id'] as int?,
            name: row['name'] as String,
            type: CategoryType.values[row['type'] as int],
            createdOn: __DateTimeConverter.decode(row['createdOn'] as int),
            icon: CategoryIcon.values[row['icon'] as int]),
        arguments: [id]);
  }

  @override
  Future<List<TransactionCategory>> findAllCategories() async {
    return _queryAdapter.queryList('SELECT * FROM categories',
        mapper: (Map<String, Object?> row) => TransactionCategory(
            id: row['id'] as int?,
            name: row['name'] as String,
            type: CategoryType.values[row['type'] as int],
            createdOn: __DateTimeConverter.decode(row['createdOn'] as int),
            icon: CategoryIcon.values[row['icon'] as int]));
  }

  @override
  Future<int> insertCategory(TransactionCategory category) {
    return _transactionCategoryInsertionAdapter.insertAndReturnId(
        category, OnConflictStrategy.replace);
  }

  @override
  Future<int> deleteCategory(TransactionCategory category) {
    return _transactionCategoryDeletionAdapter
        .deleteAndReturnChangedRows(category);
  }
}

// ignore_for_file: unused_element
final __DateTimeConverter = _DateTimeConverter();
