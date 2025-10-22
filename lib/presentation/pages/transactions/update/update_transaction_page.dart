import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/constants/constants.dart';
import 'package:my_money/extensions/double.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/presentation/pages/transactions/update/state/update_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/update/state/update_transaction_state.dart';
import 'package:my_money/presentation/pages/transactions/update/widgets/account_and_category_selector.dart';
import 'package:my_money/presentation/pages/transactions/update/widgets/amount_field.dart';
import 'package:my_money/presentation/pages/transactions/update/widgets/date_time_selector.dart';
import 'package:my_money/presentation/pages/transactions/update/widgets/transaction_type_selector.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';

class UpdateTransactionParams {
  final Transaction? transaction;

  UpdateTransactionParams({this.transaction});
}

class UpdateTransactionPage extends StatelessWidget {
  final UpdateTransactionParams params;

  const UpdateTransactionPage({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: params.transaction == null ? "Create" : "Update",
      trailing: BlocBuilder<UpdateTransactionCubit, UpdateTransactionState>(
        builder: (context, state) {
          return Opacity(
            opacity: state.isValid ? 1 : 0.5,
            child: TextButton(
              onPressed: () {
                if (!state.isValid) return;
                if (params.transaction != null) {
                  context.read<UpdateTransactionCubit>().update();
                } else {
                  context.read<UpdateTransactionCubit>().create();
                }

                context.pop(context);
              },
              child: const Text("Save"),
            ),
          );
        },
      ),
      onBackButtonPressed: context.pop,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
            onChange: context.read<UpdateTransactionCubit>().setAmount,
            keyboardType: TextInputType.number,
            autofocus: true,
            initialValue: params.transaction?.amount.toString(),
          ),

          const SizedBox(height: kVerticalSpacing),

          // name
          CustomTextField(
            hint: "Notes",
            onChange: context.read<UpdateTransactionCubit>().setNotes,
            maxLines: 4,
            initialValue: params.transaction?.notes,
          ),

          const SizedBox(height: kVerticalSpacing),
        ],
      ),
    );
  }
}
