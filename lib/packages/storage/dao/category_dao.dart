part of '../storage.dart';

@dao
abstract class _CategoryDao {
  static const String tableName = 'categories';

  @Query('SELECT * FROM $tableName WHERE id = :id')
  Future<TransactionCategory?> findCategoryById(int id);

  @Query('SELECT * FROM $tableName')
  Future<List<TransactionCategory>> findAllCategories();

  @insert
  Future<int> insertCategory(TransactionCategory category);
}
