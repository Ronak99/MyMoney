import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_state.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/widgets/list_view_separated.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTransactionCubit, CreateTransactionState>(
      buildWhen: (prev, next) => prev.category != next.category,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => CategorySelectorSheet.show(context),
          child: Container(
            child: Row(
              children: [
                const Icon(Icons.wallet),
                Text(state.category?.name ?? "Select Category")
              ],
            ),
          ),
        );
      },
    );
  }
}

class CategorySelectorSheet extends StatelessWidget {
  static show(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) => const CategorySelectorSheet(),
      );

  const CategorySelectorSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = RouteGenerator.categoryCubit.state.categories;

    return Material(
      color: Colors.transparent,
      child: Container(
        height: 500,
        child: ListViewSeparated<TransactionCategory>(
          list: categories,
          itemBuilder: (context, index, category) {
            return GestureDetector(
              onTap: () => context.read<CreateTransactionCubit>().setCategory(category),
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.wallet),
                    Text(category.name)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
