import 'package:flutter/material.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/account_selector.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/amount_field.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/category_selector.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/date_time_selector.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/transaction_type_selector.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTransactionPage extends StatelessWidget {
  const CreateTransactionPage({super.key});

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
            // select transaction type
            const TransactionTypeSelector(),

            // account and category selector
            const Row(
              children: [
                AccountSelector(),
                CategorySelector(),
              ],
            ),

            // amount
            CustomTextField(
              hint: "Amount",
              onChange: context.read<CreateTransactionCubit>().setAmount,

            ),

            // name
            CustomTextField(
              hint: "Name",
              onChange: context.read<CreateTransactionCubit>().setName,
            ),

            // description
            CustomTextField(
              hint: "Description",
              onChange: context.read<CreateTransactionCubit>().setDescription,
            ),

            // date
            const DateTimeSelector(),

            // create
            TextButton(
              onPressed: () {
                context.read<CreateTransactionCubit>().create();
                Navigator.pop(context);
              },
              child: const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}
