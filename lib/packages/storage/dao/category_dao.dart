part of '../storage.dart';

@dao
abstract class _CategoryDao {
  @Query('SELECT * FROM Category WHERE id = :id')
  Future<TransactionCategory?> findCategoryById(int id);

  @Query('SELECT * FROM Category')
  Future<List<TransactionCategory>> findAllCategories();
}
