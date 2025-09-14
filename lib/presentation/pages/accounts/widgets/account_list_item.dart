import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_money/extensions/account_icon.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/menu_item.dart';

class AccountListItem extends StatelessWidget {
  final Account account;
  final VoidCallback? onTap;

  const AccountListItem({
    super.key,
    required this.account,
    this.onTap,
  });

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
              child: Image.asset(account.icon.assetName),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(account.name),
                      Text(
                        account.formatBalance,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () => context.showCustomMenu([
                        MenuItem(
                          value: 'edit',
                          label: 'Edit',
                          icon: Icons.edit,
                          onTap: () {},
                        ),
                        MenuItem(
                          value: 'delete',
                          label: 'Delete',
                          icon: CupertinoIcons.delete,
                          onTap: () {},
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
