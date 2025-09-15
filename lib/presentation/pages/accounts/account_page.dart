import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/presentation/widgets/custom_bottom_sheet.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:my_money/presentation/widgets/empty_state.dart';
import 'package:my_money/presentation/widgets/list_item.dart';
import 'package:my_money/presentation/widgets/list_view_separated.dart';
import 'package:my_money/state/account/account_cubit.dart';
import 'package:my_money/state/account/account_state.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) => CustomScaffold(
        title: 'Accounts',
        fab: state.accounts.isEmpty
            ? null
            : FloatingActionButton(
                heroTag: 'accounts',
                onPressed: () =>
                    CustomBottomSheet.modifyAccount().show(context),
                child: const Icon(Icons.add),
              ),
        body: AnimatedCrossFade(
          firstChild: ListViewSeparated<Account>(
            list: state.accounts,
            itemBuilder: (context, _, account) {
              return ListItem.account(account);
            },
          ),
          secondChild: EmptyState.noBankAccount(),
          crossFadeState: state.accounts.isNotEmpty
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 350),
        ),
      ),
    );
  }
}
