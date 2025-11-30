part of '../storage.dart';

@dao
abstract class _CategoryDao {
  static const String tableName = 'categories';

  @Query('SELECT * FROM $tableName')
  Stream<List<TransactionCategory>> streamAllCategories();

  @Query('SELECT * FROM $tableName WHERE id = :id')
  Future<TransactionCategory?> findCategoryById(int id);

  @Query('SELECT * FROM $tableName')
  Future<List<TransactionCategory>> findAllCategories();

  @Insert(onConflict: OnConflictStrategy.abort)
  Future<int> insertCategory(TransactionCategory category);

  @delete
  Future<int> deleteCategory(TransactionCategory category);

  @Query('DELETE FROM $tableName')
  Future<void> deleteAllCategories();
}
