import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_money/extensions/build_context.dart';

class CapsuleDateSelector extends StatelessWidget {
  final String selectedDate;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final BuildContext context;

  const CapsuleDateSelector({
    super.key,
    required this.context,
    required this.selectedDate,
    required this.onPrev,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
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
