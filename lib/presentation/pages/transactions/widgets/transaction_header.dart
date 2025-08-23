import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_money/extensions/build_context.dart';

class TransactionHeader extends StatelessWidget {
  final String selectedDate;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final VoidCallback onFilter;
  final VoidCallback onSearch;

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
          _CircleIconButton(
            icon: Icons.filter_list,
            onTap: onFilter,
            context: context,
          ),
          _DateSelector(
            context: context,
            selectedDate: selectedDate,
            onPrev: onPrev,
            onNext: onNext,
          ),
          _CircleIconButton(
            icon: CupertinoIcons.search,
            onTap: onSearch,
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

class _DateSelector extends StatelessWidget {
  final String selectedDate;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final BuildContext context;

  const _DateSelector({
    required this.context,
    required this.selectedDate,
    required this.onPrev,
    required this.onNext,
  });

  @override
  Widget build(BuildContext _) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: context.colorScheme.onSurface.withOpacity(.1),
        ),
      ),
      width: 225,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          _ArrowButton(
            icon: CupertinoIcons.left_chevron,
            onPressed: onPrev,
            context: context,
          ),
          Expanded(
            child: Center(
              child: Text(
                selectedDate,
                style: context.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.colorScheme.onSurface.withOpacity(.8),
                ),
              ),
            ),
          ),
          _ArrowButton(
            icon: CupertinoIcons.right_chevron,
            onPressed: onNext,
            context: context,
          ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final BuildContext context;

  const _ArrowButton({
    required this.icon,
    required this.onPressed,
    required this.context,
  });

  @override
  Widget build(BuildContext _) {
    return SizedBox(
      height: 30,
      width: 30,
      child: IconButton(
        iconSize: 15,
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: context.colorScheme.onSurface.withOpacity(.8),
        ),
      ),
    );
  }
}
