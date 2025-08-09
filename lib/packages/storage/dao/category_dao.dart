part of '../storage.dart';

@dao
abstract class _CategoryDao {
  @Query('SELECT * FROM Category WHERE id = :id')
  Future<Category?> findCategoryById(int id);

  @Query('SELECT * FROM Category')
  Future<List<Category>> findAllCategories();
}
