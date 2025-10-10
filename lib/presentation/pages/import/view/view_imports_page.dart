import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/enums/date_action.dart';
import 'package:my_money/extensions/date.dart';
import 'package:my_money/extensions/transactions.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/presentation/pages/import/state/import_cubit.dart';
import 'package:my_money/presentation/pages/import/state/import_state.dart';
import 'package:my_money/presentation/pages/import/widgets/imported_transaction_list_item.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/widgets/capsule_date_selector.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:my_money/presentation/widgets/list_view_with_header.dart';

class ViewImportsPage extends StatefulWidget {
  const ViewImportsPage({super.key});

  @override
  State<ViewImportsPage> createState() => _ViewImportsPageState();
}

class _ViewImportsPageState extends State<ViewImportsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RouteGenerator.importCubit.resolveContent(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "View Imports",
      onBackButtonPressed: context.pop,
      body: SizedBox(
        width: double.infinity,
        child: BlocBuilder<ImportCubit, ImportState>(builder: (context, state) {
          return state.isLoading
              ? Center(child: CupertinoActivityIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      child: ListViewWithHeader<String, Transaction>(
                        map: state.filteredTransactions.groupByDate,
                        headerBuilder: (date) => Text(date),
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
