import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/packages/storage/storage.dart';
import 'package:my_money/state/category/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState()) {
    initialize();
  }

  void initialize() {
    Get.find<LocalStorageService>().streamAllCategories().listen((data) {
      emit(state.copyWith(categories: data));
    });
  }

  Future<TransactionCategory> addCategory(TransactionCategory category) async {
    try {
      await Get.find<LocalStorageService>().addCategory(category);
      return category;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateCategory(TransactionCategory category) async {
    try {
      await Get.find<LocalStorageService>().updateCategory(category);
    } catch (e) {
      rethrow;
    }
  }
}
