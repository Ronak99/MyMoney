import 'package:flutter/material.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';
import 'package:go_router/go_router.dart';

class CreateTransactionPage extends StatelessWidget {
  const CreateTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      leading: TextButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.cancel),
      ),
      trailing: ElevatedButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.check),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Column(
          children: [

            // select transaction type





          ],
        ),
      ),
    );
  }
}
