import 'package:flutter/material.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/presentation/widgets/list_item.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionListItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transaction.category!.name),
                      Row(
                        children: [
                          Text(transaction.account!.name),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Text(
            transaction.amount.toString(),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }
}
