import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_money/packages/parser/parser.dart';
import 'package:my_money/presentation/routes/route_generator.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionsCubit = RouteGenerator.transactionCubit;
    final transactions = transactionsCubit.state.transactions;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final records = await Get.find<BankStatementService>().extractDataFromPDF(bank: Bank.fi, password: "RONA1005");
          transactionsCubit.setTransactions(records);
        },
        child: const Icon(Icons.add),
      ),
      body: transactions.isEmpty
          ? const Text("No Accounts")
          : SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final account = transactions[index];
            return ListTile(
              title: Text(account.name),
              trailing: Text(account.amount.toString()),
            );
          },
        ),
      ),
    );
  }
}
