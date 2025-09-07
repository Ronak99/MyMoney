import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/gen/assets.gen.dart';
import 'package:my_money/presentation/routes/routes.dart';

class EmptyState extends StatelessWidget {
  final String text;
  final Image image;
  final List<Widget> actions;

  const EmptyState._(
      {super.key,
      required this.text,
      required this.actions,
      required this.image});

  factory EmptyState.noTransactions(BuildContext context) {
    final actions = [
      ElevatedButton(
        onPressed: () => context.push(Routes.CREATE_TRANSACTION.value),
        child: const Text("Record your first transaction"),
      ),
      const SizedBox(height: 12),
      TextButton(
        onPressed: () => context.showSuccessSnackBar("Awesome"),
        child: const Text("Import bank statement"),
      ),
    ];

    return EmptyState._(
      text: "No records in this month",
      actions: actions,
      image: Assets.images.noContent.image(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width * .35,
          child: image,
        ),
        const SizedBox(height: 12),
        Text(
          text,
          style: context.textTheme.titleMedium!.copyWith(
            color: context.colorScheme.onSurface.withOpacity(.8),
          ),
        ),
        const SizedBox(height: 24),
        ...actions,
      ],
    );
  }
}
