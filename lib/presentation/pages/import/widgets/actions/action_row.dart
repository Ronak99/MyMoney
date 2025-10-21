part of '../imported_transaction_list_item.dart';

class ActionRow extends StatelessWidget {
  final Transaction transaction;

  const ActionRow({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                _ImportedTransactionActionType.bank => ActionButton.account(
                    transaction,
                    defaultLabel: e.label,
                  ),
                _ImportedTransactionActionType.category =>
                  ActionButton.category(
                    transaction,
                    defaultLabel: e.label,
                  ),
                _ImportedTransactionActionType.notes => ActionButton.notes(
                    transaction,
                    defaultLabel: e.label,
                  ),
              },
            )
            .toList(),
      ),
    );
  }
}

enum _ImportedTransactionActionType {
  bank(label: 'Select Bank'),
  category(label: 'Select Category'),
  notes(label: 'Update Note');

  final String label;

  const _ImportedTransactionActionType({required this.label});
}
