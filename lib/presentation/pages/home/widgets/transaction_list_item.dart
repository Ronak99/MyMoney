import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/extensions/category_icon.dart';
import 'package:my_money/extensions/transaction.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/presentation/pages/transactions/update/update_transaction_page.dart';
import 'package:my_money/presentation/routes/routes.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.push(
        Routes.UPDATE_TRANSACTION.value,
        extra: UpdateTransactionParams(transaction: transaction),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            if (transaction.category != null)
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(12),
                child: Image.asset(transaction.category!.icon.assetName),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(transaction.category?.name ?? 'Unknown'),
                        Row(
                          children: [
                            Text(transaction.account?.name ?? 'Unknown'),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
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
    );
  }
}
