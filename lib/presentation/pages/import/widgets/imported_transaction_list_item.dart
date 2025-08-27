import 'package:flutter/material.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/model/transaction_category.dart';

class ImportedTransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const ImportedTransactionListItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    transaction.notes,
                    style: context.textTheme.bodySmall,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Flexible(
                //       child: DropdownMenu<TransactionCategory>(
                //         initialSelection: TransactionCategory.unknown(),
                //         dropdownMenuEntries: [TransactionCategory.unknown()]
                //             .map((e) => DropdownMenuEntry<TransactionCategory>(
                //           value: e,
                //           label: e.name,
                //
                //         ))
                //             .toList(),
                //         onSelected: (bank) {
                //           // if (bank != null) onBankSelected(bank);
                //         },
                //       ),
                //     ),
                //     Flexible(
                //       child: TextButton(onPressed: () => {}, child: Text("Edit Note")),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                child: Text(
                  "${transaction.transactionType == TransactionType.expense ? "-" : ""} ${transaction.amount}",
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: switch (transaction.transactionType) {
                      TransactionType.transfer => context.colorScheme.primary,
                      TransactionType.income => context.colorScheme.tertiary,
                      _ => context.colorScheme.error,
                    },
                  ),
                ),
              ),
              // DropdownMenu<TransactionType>(
              //   initialSelection: TransactionType.expense,
              //   dropdownMenuEntries: TransactionType.values
              //       .map((e) => DropdownMenuEntry<TransactionType>(
              //     value: e,
              //     label: e.name,
              //   ))
              //       .toList(),
              //   onSelected: (bank) {
              //     // if (bank != null) onBankSelected(bank);
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
