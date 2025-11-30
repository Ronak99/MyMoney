import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/extensions/account_icon.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/extensions/category_icon.dart';
import 'package:my_money/extensions/transaction_type.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/pages/transactions/update/state/update_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/update/state/update_transaction_state.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/widgets/custom_bottom_sheet.dart';
import 'package:my_money/presentation/widgets/form_container.dart';

class SelectorItem<T> extends StatelessWidget {
  final Widget icon;
  final String placeholder;
  final T? selectedItem;
  final String Function(T) getDisplayName;
  final VoidCallback onTap;
  final bool isLast;

  const SelectorItem({
    super.key,
    required this.icon,
    required this.placeholder,
    required this.selectedItem,
    required this.getDisplayName,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
            margin: const EdgeInsets.only(left: 24),
            child: Row(
              children: [
                SizedBox(height: 22, width: 22, child: icon),
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

class AccountAndCategorySelector extends StatelessWidget {
  const AccountAndCategorySelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      child: Column(
        children: [
          BlocBuilder<UpdateTransactionCubit, UpdateTransactionState>(
            buildWhen: (prev, next) => prev.account != next.account,
            builder: (context, state) {
              return SelectorItem<Account>(
                icon: state.account == null
                    ? const Icon(Icons.wallet)
                    : Image.asset(state.account!.icon.assetName),
                placeholder: "Create First Account",
                selectedItem: state.account,
                getDisplayName: (account) => account.name,
                onTap: () async {
                  Account? account = state.account;
                  if (RouteGenerator.accountCubit.state.accounts.isEmpty) {
                    account = await CustomBottomSheet.modifyAccount()
                        .show<Account?>(context);
                  } else {
                    account = await CustomBottomSheet.selectAccount(account)
                        .show(context);
                  }
                  if (!context.mounted) return;
                  if (account == null) return;
                  context.read<UpdateTransactionCubit>().setAccount(account);
                },
              );
            },
          ),
          BlocBuilder<UpdateTransactionCubit, UpdateTransactionState>(
            buildWhen: (prev, next) => prev.category != next.category,
            builder: (context, state) {
              return SelectorItem<TransactionCategory>(
                icon: state.category == null
                    ? const Icon(Icons.category_rounded)
                    : Image.asset(state.category!.icon.assetName),
                // SvgPicture.asset(state.category!.icon.assetName),
                isLast: true,
                placeholder: "Create First Category",
                selectedItem: state.category,
                getDisplayName: (category) => category.name,
                onTap: () async {
                  TransactionCategory? category = state.category;
                  if (RouteGenerator.categoryCubit.state.categories.isEmpty) {
                    category =
                        await CustomBottomSheet.modifyCategory().show(context);
                  } else {
                    category = await CustomBottomSheet.selectCategory(
                      categoryType: state.transactionType.toCategoryType,
                    ).show(context);
                  }
                  if (!context.mounted) return;
                  if (category == null) return;
                  context.read<UpdateTransactionCubit>().setCategory(category);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
