import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/enums/category_type.dart';
import 'package:my_money/extensions/categories.dart';
import 'package:my_money/extensions/string.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/pages/categories/widgets/category_list_item.dart';
import 'package:my_money/presentation/widgets/custom_bottom_sheet.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:my_money/presentation/widgets/list_view_with_header.dart';
import 'package:my_money/state/category/category_cubit.dart';
import 'package:my_money/state/category/category_state.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Categories',
      fab: FloatingActionButton(
        heroTag: 'categories',
        onPressed: () => CustomBottomSheet.modifyCategory().show(context),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          return ListViewWithHeader<CategoryType, TransactionCategory>(
            map: state.categories.groupByType,
            headerBuilder: (categoryType) => Text(
              categoryType.name.capitalizeFirstLetter,
            ),
            itemBuilder: (item) => CategoryListItem(category: item),
          );
        },
      ),
    );
  }
}
