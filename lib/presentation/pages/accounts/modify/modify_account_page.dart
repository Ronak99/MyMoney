import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:my_money/extensions/date.dart';
import 'package:my_money/presentation/pages/accounts/modify/state/modify_account_cubit.dart';
import 'package:my_money/presentation/pages/accounts/modify/state/modify_account_state.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/amount_field.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';

class ModifyAccountPage extends StatelessWidget {
  const ModifyAccountPage({super.key});

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
            // name
            CustomTextField(
              hint: "Account Name",
              onChange: context.read<ModifyAccountCubit>().setName,
            ),

            // initial balance
            CustomTextField(
              hint: "Initial Balance",
              onChange: context.read<ModifyAccountCubit>().setBalance,
            ),

            // created on date (optional, defaults to now)
            const AccountDateTimeSelector(),

            // create
            TextButton(
              onPressed: () {
                context.read<ModifyAccountCubit>().create();
                Navigator.pop(context);
              },
              child: const Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountDateTimeSelector extends StatelessWidget {
  const AccountDateTimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModifyAccountCubit, ModifyAccountState>(
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
              context.read<ModifyAccountCubit>().setCreatedOn(picked);
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