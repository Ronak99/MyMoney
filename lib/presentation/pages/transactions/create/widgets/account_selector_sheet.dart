import 'package:flutter/material.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/widgets/list_view_separated.dart';
import 'package:go_router/go_router.dart';

class AccountSelectorSheet extends StatelessWidget {
  static Future<Account?> show(BuildContext context) => showModalBottomSheet(
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
              onTap: () => context.pop(account),
              child: Container(
                child: Row(
                  children: [Icon(Icons.wallet), Text(account.name)],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
