import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/state/category/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState());
}
