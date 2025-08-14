import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final Widget child;
  const ListItem({super.key, this.leading, this.trailing, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          leading ?? const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: child,
          ),
          const Spacer(),
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
