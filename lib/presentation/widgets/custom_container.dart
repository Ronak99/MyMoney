import 'package:flutter/material.dart';
import 'package:my_money/extensions/build_context.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final Widget? child;


  const CustomContainer({
    super.key,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: height,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: context.colorScheme.surface,
        ),
        child: child,
      ),
    );
  }
}
