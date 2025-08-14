import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_money/extensions/transactions.dart';
import 'package:my_money/packages/parser/parser.dart';
import 'package:my_money/packages/storage/storage.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/state/transaction/transaction_cubit.dart';
import 'package:my_money/state/transaction/transaction_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () async {
              final records = await Get.find<BankStatementService>().extract(
                bank: Bank.fi,
                filename: "statement.pdf",
                password: "RONA1005",
              );
              RouteGenerator.transactionCubit.setTransactions(records);
            },
            child: Text("FI"),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () async {
              final records = await Get.find<BankStatementService>().extract(
                bank: Bank.icici,
                filename: "statement_icici.pdf",
                password: "RONA1005",
              );
              RouteGenerator.transactionCubit.setTransactions(records);
            },
            child: Text("ICICI"),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () async {
              final records = await Get.find<BankStatementService>().extract(
                bank: Bank.sbi,
                filename: "statement_sbi.pdf",
                password: "1005@9742",
              );
              RouteGenerator.transactionCubit.setTransactions(records);
            },
            child: Text("SBI"),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () async {
              final records = await Get.find<BankStatementService>().extract(
                bank: Bank.hdfc,
                filename: "statement_hdfc.pdf",
                password: "1005@9742",
              );
              RouteGenerator.transactionCubit.setTransactions(records);
            },
            child: Text("HDFC"),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () async {
              final service = Get.find<LocalStorageService>();

              // service.addAccount(account);
              // service.addCategory(category);
              //
              // service.addTransaction(transaction);
              //
              // service.getAllTransactions();
            },
            child: Text("Test DB"),
          ),
        ],
      ),
      body: BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
        final transactions = state.transactions;
        return transactions.isEmpty
            ? const Text("No Accounts")
            : SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: transactions.groupByDate.keys.length,
                  itemBuilder: (context, index) {
                    final tDate =
                        transactions.groupByDate.keys.elementAt(index);

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
              );
      }),
    );
  }
}
