part of '../imported_transaction_list_item.dart';

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
