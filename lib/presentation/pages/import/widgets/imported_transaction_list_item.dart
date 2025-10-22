import 'package:flutter/material.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/extensions/transaction.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/widgets/custom_bottom_sheet.dart';

part 'actions/action_button.dart';
part 'actions/action_row.dart';

class ImportedTransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const ImportedTransactionListItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => {
        RouteGenerator.importCubit.updateTransaction(
          transaction.copyWith(
            transactionType: transaction.isExpense
                ? TransactionType.income
                : TransactionType.expense,
          ),
        )
      },
      behavior: HitTestBehavior.translucent,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    transaction.notes,
                    style: context.textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Text(
                  transaction.formattedAmount,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: transaction.amountForegroundColor(context),
                  ),
                ),
              ],
            ),
          ),
          ActionRow(transaction: transaction),
        ],
      ),
    );
  }
}
