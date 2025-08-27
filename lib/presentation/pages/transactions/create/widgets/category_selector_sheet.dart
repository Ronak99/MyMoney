import 'package:flutter/material.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/widgets/list_view_separated.dart';
import 'package:go_router/go_router.dart';


class CategorySelectorSheet extends StatelessWidget {
  static Future<TransactionCategory?> show(BuildContext context) =>
      showModalBottomSheet(
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
              onTap: () => context.pop(category),
              child: Container(
                child: Row(
                  children: [Icon(Icons.wallet), Text(category.name)],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
