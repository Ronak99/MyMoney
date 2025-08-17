import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/presentation/pages/accounts/widgets/account_list_item.dart';
import 'package:my_money/presentation/routes/routes.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:my_money/presentation/widgets/list_view_separated.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/state/account/account_cubit.dart';
import 'package:my_money/state/account/account_state.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Accounts',
      fab: FloatingActionButton(
        onPressed: () => context.push(Routes.MODIFY_ACCOUNT.value),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) {
            return ListViewSeparated<Account>(
              list: state.accounts,
              itemBuilder: (context, _, account) {
                return AccountListItem(account: account);
              },
            );
          }),
    );
  }
}
