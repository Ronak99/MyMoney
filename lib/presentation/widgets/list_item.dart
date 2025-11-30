import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_money/extensions/account_icon.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/extensions/category_icon.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/menu_item.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/widgets/custom_bottom_sheet.dart';

typedef SubtitleBuilder = Widget Function(BuildContext context);
typedef TitleBuilder = Widget Function(BuildContext context);

class ListItem extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final TitleBuilder titleBuilder;
  final SubtitleBuilder? subtitleBuilder;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ListItem._({
    super.key,
    required this.onTap,
    required this.image,
    required this.titleBuilder,
    this.subtitleBuilder,
    required this.onEdit,
    required this.onDelete,
  });

  factory ListItem.account(Account account) {
    return ListItem._(
      onTap: () {},
      image: account.icon.assetName,
      titleBuilder: (context) => Text(account.name),
      subtitleBuilder: (context) => Text(
        account.formatBalance,
        style: context.textTheme.bodyLarge!
            .copyWith(color: context.colorScheme.primary),
      ),
      onEdit: () => CustomBottomSheet.modifyAccount(account).show(),
      onDelete: () => RouteGenerator.accountCubit.delete(account),
    );
  }

  factory ListItem.category(TransactionCategory category) {
    return ListItem._(
      onTap: () {},
      image: category.icon.assetName,
      titleBuilder: (context) => Text(
        category.name,
        style: context.textTheme.bodyLarge!,
      ),
      onEdit: () => CustomBottomSheet.modifyCategory(category: category).show(),
      onDelete: () => RouteGenerator.categoryCubit.delete(category),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(12),
              child: Image.asset(image),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleBuilder(context),
                      if (subtitleBuilder != null) subtitleBuilder!(context),
                    ],
                  ),
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () => context.showCustomMenu([
                        MenuItem(
                          value: 'edit',
                          label: 'Edit',
                          icon: Icons.edit,
                          onTap: onEdit,
                        ),
                        MenuItem(
                          value: 'delete',
                          label: 'Delete',
                          icon: CupertinoIcons.delete,
                          onTap: onDelete,
                          isDestructive: true,
                        ),
                      ]),
                      icon: const Icon(Icons.more_horiz),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
