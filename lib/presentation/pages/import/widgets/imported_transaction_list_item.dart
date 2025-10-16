import 'package:flutter/material.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/extensions/transaction.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/widgets/custom_bottom_sheet.dart';

enum _ImportedTransactionActionType {
  bank(label: 'Select Bank'),
  category(label: 'Select Category'),
  notes(label: 'Update Note');

  final String label;

  const _ImportedTransactionActionType({required this.label});
}

class ImportedTransactionListItem extends StatelessWidget {
  final Transaction transaction;

  const ImportedTransactionListItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: context.colorScheme.primary.withOpacity(.1),
            ),
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _ImportedTransactionActionType.bank,
                _ImportedTransactionActionType.category,
                _ImportedTransactionActionType.notes
              ]
                  .map(
                    (e) => switch (e) {
                      _ImportedTransactionActionType.bank =>
                        ActionButton.account(
                          transaction,
                          defaultLabel: e.label,
                        ),
                      _ImportedTransactionActionType.category =>
                        ActionButton.category(
                          transaction,
                          defaultLabel: e.label,
                        ),
                      _ImportedTransactionActionType.notes =>
                        ActionButton.notes(
                          transaction,
                          defaultLabel: e.label,
                        ),
                    },
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool borderEnabled;
  final String label;

  const ActionButton._({
    super.key,
    required this.onTap,
    this.borderEnabled = false,
    required this.label,
  });

  factory ActionButton.account(
    Transaction transaction, {
    required String defaultLabel,
  }) {
    return ActionButton._(
      onTap: () async {
        final account =
            await CustomBottomSheet.selectAccount().show<Account?>();
        if (account == null) return;

        RouteGenerator.importCubit.updateTransaction(
          transaction.copyWith(
            account: account,
            categoryId: account.id,
          ),
        );
      },
      label: transaction.account?.name ?? defaultLabel,
    );
  }

  factory ActionButton.category(
    Transaction transaction, {
    required String defaultLabel,
  }) {
    return ActionButton._(
      onTap: () async {
        final category = await CustomBottomSheet.selectCategory()
            .show<TransactionCategory?>();
        if (category == null) return;

        RouteGenerator.importCubit.updateTransaction(
          transaction.copyWith(
            category: category,
            categoryId: category.id,
          ),
        );
      },
      borderEnabled: true,
      label: transaction.category?.name ?? defaultLabel,
    );
  }

  factory ActionButton.notes(
    Transaction transaction, {
    required String defaultLabel,
  }) {
    return ActionButton._(
      onTap: () async {
        final note =
            await CustomBottomSheet.transactionNote(transaction.notes).show();
        if (note == null) return;

        RouteGenerator.importCubit.updateTransaction(
          transaction.copyWith(notes: note),
        );
      },
      label: defaultLabel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            border: borderEnabled
                ? Border.symmetric(
                    vertical: BorderSide(
                      width: .5,
                      color: context.colorScheme.primary.withOpacity(.2),
                    ),
                  )
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurface.withOpacity(.7),
            ),
          ),
        ),
      ),
    );
  }
}
