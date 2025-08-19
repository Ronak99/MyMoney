import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/enums/date_action.dart';
import 'package:my_money/extensions/date.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/presentation/pages/home/widgets/transaction_list_item.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/routes/routes.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:my_money/presentation/widgets/list_view_separated.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/state/transaction/transaction_cubit.dart';
import 'package:my_money/state/transaction/transaction_state.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Transactions',
      fab: FloatingActionButton(
        heroTag: 'transactions',
        onPressed: () => context.push(Routes.CREATE_TRANSACTION.value),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => RouteGenerator.transactionCubit.updateDate(
                    action: DateAction.decrementMonth,
                  ),
                  icon: const Icon(Icons.chevron_left),
                ),
                Text(state.selectedDate!.formatDate),
                IconButton(
                  onPressed: () => RouteGenerator.transactionCubit.updateDate(
                    action: DateAction.incrementMonth,
                  ),
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
            Expanded(
              child: ListViewSeparated<Transaction>(
                list: state.transactions,
                itemBuilder: (context, _, transaction) {
                  return TransactionListItem(transaction: transaction);
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
