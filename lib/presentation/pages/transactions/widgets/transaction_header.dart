import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/presentation/widgets/capsule_date_selector.dart';

class TransactionHeader extends StatelessWidget {
  final String selectedDate;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback? onFilter;
  final VoidCallback? onSearch;

  const TransactionHeader({
    super.key,
    required this.selectedDate,
    required this.onPrev,
    required this.onNext,
    required this.onFilter,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (onFilter != null)
            _CircleIconButton(
              icon: Icons.filter_list,
              onTap: onFilter!,
              context: context,
            ),
          Expanded(
            child: Center(
              child: CapsuleDateSelector(
                context: context,
                selectedDate: selectedDate,
                onPrev: onPrev,
                onNext: onNext,
              ),
            ),
          ),
          if (onSearch != null)
            _CircleIconButton(
              icon: CupertinoIcons.search,
              onTap: onSearch!,
              context: context,
            ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final BuildContext context;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
    required this.context,
  });

  @override
  Widget build(BuildContext _) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colorScheme.onSurface.withOpacity(.1),
        ),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: Icon(icon, size: 15),
      ),
    );
  }
}
