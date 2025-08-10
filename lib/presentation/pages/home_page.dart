import 'package:flutter/material.dart';
import 'package:my_money/presentation/routes/route_generator.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final accountCubit = RouteGenerator.accountCubit;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          accountCubit.addAccount(name: 'SBI', balance: 10000);
        },
        child: const Icon(Icons.add),
      ),
      body: accountCubit.state.accounts.isEmpty
          ? const Text("No Accounts")
          : SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: accountCubit.state.accounts.length,
          itemBuilder: (context, index) {
            final account = accountCubit.state.accounts[index];
            return ListTile(
              title: Text(account.name),
              trailing: Text(account.balance.toString()),
            );
          },
        ),
      ),
    );
  }
}
