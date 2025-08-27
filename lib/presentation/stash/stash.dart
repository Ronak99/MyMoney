/// group by builder
// body: BlocBuilder<TransactionCubit, TransactionState>(
// builder: (context, state) {
// return ListViewSeparated<Transaction>(
// list: state.transactions,x
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
//                 transactions. groupByDate.keys.elementAt(index);
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
