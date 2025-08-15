import 'package:flutter/material.dart';
import 'package:my_money/model/mock.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/presentation/pages/home/widgets/transaction_list_item.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:my_money/presentation/widgets/list_view_separated.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Transactions',
      body: ListViewSeparated<Transaction>(
        list: Mock.transactions,
        itemBuilder: (context, _, transaction) {
          return TransactionListItem(transaction: transaction);
        },
      ),
    );
  }
}
