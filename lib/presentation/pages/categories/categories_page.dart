import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/pages/categories/widgets/category_list_item.dart';
import 'package:my_money/presentation/routes/routes.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:my_money/presentation/widgets/list_view_separated.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/state/category/category_cubit.dart';
import 'package:my_money/state/category/category_state.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Categories',
      fab: FloatingActionButton(
        onPressed: () => context.push(Routes.MODIFY_CATEGORY.value),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return ListViewSeparated<TransactionCategory>(
              list: state.categories,
              itemBuilder: (context, _, category) {
                return CategoryListItem(category: category);
              },
            );
          }),
    );
  }
}
