import 'package:flutter/material.dart';
import 'package:my_money/extensions/date.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/pages/categories/modify/state/modify_category_cubit.dart';
import 'package:my_money/presentation/pages/categories/modify/state/modify_category_state.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/amount_field.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ModifyCategoryPage extends StatelessWidget {
  const ModifyCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      leading: TextButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.cancel),
      ),
      trailing: ElevatedButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.check),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            // category type selector
            const CategoryTypeSelector(),

            // name
            CustomTextField(
              hint: "Category Name",
              onChange: context.read<ModifyCategoryCubit>().setName,
            ),

            // description
            CustomTextField(
              hint: "Description",
              onChange: context.read<ModifyCategoryCubit>().setDescription,
            ),

            // created on date (optional, defaults to now)
            const CategoryDateTimeSelector(),

            // create
            TextButton(
              onPressed: () {
                context.read<ModifyCategoryCubit>().create();
                Navigator.pop(context);
              },
              child: const Text("Create Category"),
            ),
          ],
        ),
      ),
    );
  }
}

// CategoryTypeSelector
class CategoryTypeSelector extends StatelessWidget {
  const CategoryTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyCategoryCubit, ModifyCategoryState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => context
                    .read<ModifyCategoryCubit>()
                    .setType(CategoryType.income),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: state.type == CategoryType.income
                        ? Colors.green
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Income',
                      style: TextStyle(
                        color: state.type == CategoryType.income
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: () => context
                    .read<ModifyCategoryCubit>()
                    .setType(CategoryType.expense),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: state.type == CategoryType.expense
                        ? Colors.red
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Expense',
                      style: TextStyle(
                        color: state.type == CategoryType.expense
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// CategoryDateTimeSelector
class CategoryDateTimeSelector extends StatelessWidget {
  const CategoryDateTimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyCategoryCubit, ModifyCategoryState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: state.createdOn ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (picked != null) {
              context.read<ModifyCategoryCubit>().setCreatedOn(picked);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  state.createdOn != null
                      ? state.createdOn!.formatDate
                      : 'Select Date',
                ),
                const Icon(Icons.calendar_today),
              ],
            ),
          ),
        );
      },
    );
  }
}