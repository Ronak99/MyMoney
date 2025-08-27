import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/account_and_category_selector.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/amount_field.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/date_time_selector.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/transaction_type_selector.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';

class CreateTransactionPage extends StatelessWidget {
  const CreateTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Import",
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  Text(
                    "Create",
                    style: context.textTheme.headlineLarge,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      context.read<CreateTransactionCubit>().create();
                      context.pop(context);
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  // select transaction type
                  const TransactionTypeSelector(),

                  const SizedBox(height: 12),

                  // account and category selector
                  const AccountAndCategorySelector(),

                  const SizedBox(height: 12),

                  // date
                  const DateTimeSelector(),

                  const SizedBox(height: 12),

                  // amount
                  CustomTextField(
                    hint: "Amount",
                    onChange: context.read<CreateTransactionCubit>().setAmount,
                  ),

                  const SizedBox(height: 12),

                  // name
                  CustomTextField(
                    hint: "Notes",
                    onChange: context.read<CreateTransactionCubit>().setNotes,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
