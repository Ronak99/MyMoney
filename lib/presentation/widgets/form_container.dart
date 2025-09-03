import 'package:flutter/material.dart';
import 'package:my_money/extensions/build_context.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const FormContainer({super.key, required this.child, this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.colorScheme.surfaceContainerHighest,
      ),
      child: child,
    );
  }
}
