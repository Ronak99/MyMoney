import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_money/extensions/transaction_category.dart'
    show TransactionCategoryDefaults;
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/packages/storage/storage.dart';
import 'package:my_money/state/category/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState()) {
    initialize();
  }

  void initialize() async {
    await addDefaultCategories();

    Get.find<LocalStorageService>().streamAllCategories().listen((data) {
      emit(state.copyWith(categories: data));
    });
  }

  Future<void> addDefaultCategories() async {
    final categories = TransactionCategoryDefaults.allCategories;
    for (var category in categories) {
      await add(category);
    }
  }

  Future<TransactionCategory> add(TransactionCategory category) async {
    try {
      await Get.find<LocalStorageService>().addCategory(category);
      return category;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete(TransactionCategory category) async {
    try {
      await Get.find<LocalStorageService>().deleteCategory(category);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAll() async {
    try {
      await Get.find<LocalStorageService>().deleteAllCategories();
    } catch (e) {
      rethrow;
    }
  }
}
