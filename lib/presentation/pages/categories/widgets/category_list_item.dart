import 'package:flutter/material.dart';
import 'package:my_money/extensions/category_icon.dart';
import 'package:my_money/model/transaction_category.dart';

class CategoryListItem extends StatelessWidget {
  final TransactionCategory category;
  final VoidCallback? onTap;

  const CategoryListItem({
    super.key,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
              child: Image.asset(category.icon.assetName),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(category.name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
