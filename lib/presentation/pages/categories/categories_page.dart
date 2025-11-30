import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/enums/category_type.dart';
import 'package:my_money/extensions/categories.dart';
import 'package:my_money/extensions/string.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/widgets/custom_bottom_sheet.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:my_money/presentation/widgets/empty_state.dart';
import 'package:my_money/presentation/widgets/list_item.dart';
import 'package:my_money/presentation/widgets/list_view_separated.dart';
import 'package:my_money/presentation/widgets/list_view_with_header.dart';
import 'package:my_money/state/category/category_cubit.dart';
import 'package:my_money/state/category/category_state.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) => CustomScaffold(
        title: 'Categories',
        fab: state.categories.isEmpty
            ? null
            : FloatingActionButton(
                heroTag: 'categories',
                onPressed: () =>
                    CustomBottomSheet.modifyCategory().show(context),
                child: const Icon(Icons.add),
              ),
        body: AnimatedCrossFade(
          firstChild: ListViewWithHeader<CategoryType, TransactionCategory>(
            map: state.categories.groupByType,
            headerBuilder: (CategoryType type) {
              return Text(type.name.capitalizeFirstLetter);
            },
            itemBuilder: (category) => ListItem.category(category),
          ),
          secondChild: EmptyState.noCategory(),
          crossFadeState: state.categories.isNotEmpty
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 350),
        ),
      ),
    );
  }
}
