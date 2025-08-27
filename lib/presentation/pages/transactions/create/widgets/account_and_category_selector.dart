import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_state.dart';

import 'account_selector_sheet.dart';
import 'category_selector_sheet.dart';

class SelectorItem<T> extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final T? selectedItem;
  final String Function(T) getDisplayName;
  final Future<T?> Function(BuildContext) onTap;
  final void Function(T) onSelected;
  final bool isLast;

  const SelectorItem({
    super.key,
    required this.icon,
    required this.placeholder,
    required this.selectedItem,
    required this.getDisplayName,
    required this.onTap,
    required this.onSelected,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async {
            final selected = await onTap(context);
            if (selected == null) return;
            if (!context.mounted) return;
            onSelected(selected);
          },
          child: Container(
            padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
            margin: const EdgeInsets.only(left: 24),
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(width: 12),
                Text(selectedItem != null
                    ? getDisplayName(selectedItem!)
                    : placeholder),
                const Spacer(),
                const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
        if (!isLast)
          Divider(
            height: 0,
            color: context.colorScheme.onSurface.withOpacity(.2),
            indent: 24,
            thickness: 0.5,
            endIndent: 0,
          ),
      ],
    );
  }
}

class SelectorContainer extends StatelessWidget {
  final List<Widget> children;

  const SelectorContainer({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.colorScheme.surfaceContainerHighest,
      ),
      child: Column(children: children),
    );
  }
}

// Updated AccountAndCategorySelector using the generic widgets
class AccountAndCategorySelector extends StatelessWidget {
  const AccountAndCategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectorContainer(
      children: [
        BlocBuilder<CreateTransactionCubit, CreateTransactionState>(
          buildWhen: (prev, next) => prev.account != next.account,
          builder: (context, state) {
            return SelectorItem<Account>(
              icon: Icons.wallet,
              placeholder: "Select Account",
              selectedItem: state.account,
              getDisplayName: (account) => account.name,
              onTap: (context) => AccountSelectorSheet.show(context),
              onSelected: (account) => context
                  .read<CreateTransactionCubit>()
                  .setAccount(account),
            );
          },
        ),
        BlocBuilder<CreateTransactionCubit, CreateTransactionState>(
          buildWhen: (prev, next) => prev.category != next.category,
          builder: (context, state) {
            return SelectorItem<TransactionCategory>(
              icon: Icons.category,
              placeholder: "Select Category",
              selectedItem: state.category,
              getDisplayName: (category) => category.name,
              onTap: (context) => CategorySelectorSheet.show(context),
              onSelected: (category) => context
                  .read<CreateTransactionCubit>()
                  .setCategory(category),
              isLast: true,
            );
          },
        ),
      ],
    );
  }
}