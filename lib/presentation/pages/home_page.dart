import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_money/extensions/transactions.dart';
import 'package:my_money/packages/parser/parser.dart';
import 'package:my_money/presentation/routes/route_generator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionsCubit = RouteGenerator.transactionCubit;
    final transactions = transactionsCubit.state.transactions;

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

        },
        child: const Icon(Icons.add),
      ),
      body: transactions.isEmpty
          ? const Text("No Accounts")
          : SizedBox(
              width: double.infinity,
              child: ListView.builder(
                itemCount: transactions.groupByDate.keys.length,
                itemBuilder: (context, index) {
                  final tDate = transactions.groupByDate.keys.elementAt(index);

                  return Column(
                    children: [
                      Text(tDate.toString()),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: transactions.groupByDate[tDate]!.length,
                        itemBuilder: (context, index) {
                          final transaction =
                              transactions.groupByDate[tDate]![index];

                          return ListTile(
                            title: Text(transaction.name),
                            trailing: Text(transaction.amount.toString()),
                          );
                        },
                      )
                    ],
                  );
                },
              ),
            ),
    );
  }
}
