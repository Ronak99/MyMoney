import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/gen/assets.gen.dart';
import 'package:my_money/presentation/pages/transactions/create/create_transaction_page.dart';
import 'package:my_money/presentation/routes/routes.dart';
import 'package:my_money/presentation/widgets/custom_bottom_sheet.dart';

class EmptyState extends StatelessWidget {
  final String text;
  final String image;
  final List<Widget> actions;

  const EmptyState._(
      {super.key,
      required this.text,
      required this.actions,
      required this.image});

  factory EmptyState.noTransactions(BuildContext context) {
    final actions = [
      ElevatedButton(
        onPressed: () => context.push(
          Routes.CREATE_TRANSACTION.value,
          extra: CreateTransactionParams(),
        ),
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
        image: Assets.vector.noContent);
  }

  factory EmptyState.noBankAccount() {
    final actions = [
      ElevatedButton(
        onPressed: CustomBottomSheet.modifyAccount().show,
        child: const Text("Create an account"),
      ),
    ];

    return EmptyState._(
        text: "No records in this month",
        actions: actions,
        image: Assets.vector.noContent);
  }

  factory EmptyState.noCategory() {
    final actions = [
      ElevatedButton(
        onPressed: CustomBottomSheet.modifyCategory().show,
        child: const Text("Create a category"),
      ),
    ];

    return EmptyState._(
        text: "No records in this month",
        actions: actions,
        image: Assets.vector.noContent);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 220,
          child: SvgPicture.asset(image),
        ),
        const SizedBox(height: 24),
        ...actions,
      ],
    );
  }
}
