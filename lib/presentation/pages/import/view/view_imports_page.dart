import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/enums/date_action.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/extensions/date.dart';
import 'package:my_money/extensions/transactions.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/presentation/pages/import/state/import_cubit.dart';
import 'package:my_money/presentation/pages/import/state/import_state.dart';
import 'package:my_money/presentation/pages/import/widgets/imported_transaction_list_item.dart';
import 'package:my_money/presentation/widgets/capsule_date_selector.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:my_money/presentation/widgets/list_view_with_header.dart';

class ViewImportsPage extends StatelessWidget {
  const ViewImportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "View Imports",
      body: SizedBox(
        width: double.infinity,
        child: BlocBuilder<ImportCubit, ImportState>(builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    Text(
                      "View Imports",
                      style: context.textTheme.headlineLarge,
                    ),
                    const Spacer(),
                    if (state.filteredTransactions.isNotEmpty)
                      TextButton(
                        onPressed: () {},
                        child: const Text("Save"),
                      ),
                  ],
                ),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                child: CapsuleDateSelector(
                  context: context,
                  selectedDate: state.selectedDate!.formatDate,
                  onPrev: () => context
                      .read<ImportCubit>()
                      .updateDate(action: DateAction.decrementMonth),
                  onNext: () => context
                      .read<ImportCubit>()
                      .updateDate(action: DateAction.incrementMonth),
                ),
              ),
              Expanded(
                child: ListViewWithHeader<DateTime, Transaction>(
                  map: state.filteredTransactions.groupByDate,
                  headerBuilder: (date) => Text(date.formatDate),
                  itemBuilder: (item) =>
                      ImportedTransactionListItem(transaction: item),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
