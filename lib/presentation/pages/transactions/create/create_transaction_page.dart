import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/constants/constants.dart';
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
      title: "Create",
      trailing: TextButton(
        onPressed: () {
          context.read<CreateTransactionCubit>().create();
          context.pop(context);
        },
        child: const Text("Save"),
      ),
      onBackButtonPressed: context.pop,
      body: ListView(
        children: [
          // select transaction type
          const TransactionTypeSelector(),

          const SizedBox(height: kVerticalSpacing),

          // account and category selector
          const AccountAndCategorySelector(),

          const SizedBox(height: kVerticalSpacing),

          // date
          const DateTimeSelector(),

          const SizedBox(height: kVerticalSpacing),

          // amount
          CustomTextField(
            hint: "Amount",
            onChange: context.read<CreateTransactionCubit>().setAmount,
          ),

          const SizedBox(height: kVerticalSpacing),

          // name
          CustomTextField(
            hint: "Notes",
            onChange: context.read<CreateTransactionCubit>().setNotes,
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
