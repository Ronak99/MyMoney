import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_state.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/widgets/list_view_separated.dart';

class AccountSelector extends StatelessWidget {
  const AccountSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTransactionCubit, CreateTransactionState>(
      buildWhen: (prev, next) => prev.account != next.account,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => AccountSelectorSheet.show(context),
          child: Container(
            child: Row(
              children: [
                const Icon(Icons.wallet),
                Text(state.account?.name ?? "Select Account")
              ],
            ),
          ),
        );
      },
    );
  }
}

class AccountSelectorSheet extends StatelessWidget {
  static show(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) => const AccountSelectorSheet(),
      );

  const AccountSelectorSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final accounts = RouteGenerator.accountCubit.state.accounts;

    return Material(
      color: Colors.transparent,
      child: Container(
        height: 500,
        child: ListViewSeparated<Account>(
          list: accounts,
          itemBuilder: (context, index, account) {
            return GestureDetector(
              onTap: () => context.read<CreateTransactionCubit>().setAccount(account),
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.wallet),
                    Text(account.name)
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
