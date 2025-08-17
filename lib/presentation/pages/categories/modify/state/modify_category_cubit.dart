import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/pages/categories/modify/state/modify_category_state.dart';
import 'package:my_money/presentation/routes/route_generator.dart';

class ModifyCategoryCubit extends Cubit<ModifyCategoryState> {
  ModifyCategoryCubit({
    String? name,
    String? description,
    CategoryType? type,
    DateTime? createdOn,
  }) : super(ModifyCategoryState(
    name: name,
    description: description,
    type: type ?? CategoryType.expense,
    createdOn: createdOn ?? DateTime.now(),
  ));

  void setName(String name) {
    emit(state.copyWith(name: name));
  }

  void setDescription(String description) {
    emit(state.copyWith(description: description));
  }

  void setType(CategoryType type) {
    emit(state.copyWith(type: type));
  }

  void setCreatedOn(DateTime createdOn) {
    emit(state.copyWith(createdOn: createdOn));
  }

  void create() {
    TransactionCategory category = TransactionCategory(
      name: state.name!,
      description: state.description!,
      type: state.type!,
      createdOn: state.createdOn!,
    );

    // Assuming you have a category cubit similar to transaction cubit
    RouteGenerator.categoryCubit.addCategory(category);
  }
}