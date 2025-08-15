import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/model/mock.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/presentation/pages/home/widgets/transaction_list_item.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:my_money/presentation/widgets/list_view_separated.dart';
import 'package:my_money/state/transaction/transaction_cubit.dart';
import 'package:my_money/state/transaction/transaction_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListViewSeparated<Transaction>(
        list: Mock.transactions,
        itemBuilder: (context, _, transaction) {
          return TransactionListItem(transaction: transaction);
        },
      ),
    );
  }
}

// body: BlocBuilder<TransactionCubit, TransactionState>(
// builder: (context, state) {
// return ListViewSeparated<Transaction>(
// list: state.transactions,
// itemBuilder: (context, _, transaction) {
// return TransactionListItem(transaction: transaction);
// },
// );
// }),

// final transactions = state.transactions;
// return transactions.isEmpty
//     ? const Text("No Accounts")
//     : SizedBox(
//         width: double.infinity,
//         child: ListView.builder(
//           itemCount: transactions.groupByDate.keys.length,
//           itemBuilder: (context, index) {
//             final tDate =
//                 transactions.groupByDate.keys.elementAt(index);
//
//             return Column(
//               children: [
//                 Text(tDate.toString()),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: transactions.groupByDate[tDate]!.length,
//                   itemBuilder: (context, index) {
//                     final transaction =
//                         transactions.groupByDate[tDate]![index];
//
//                     return ListTile(
//                       title: Text(transaction.name),
//                       trailing: Text(transaction.amount.toString()),
//                     );
//                   },
//                 )
//               ],
//             );
//           },
//         ),
//       );
