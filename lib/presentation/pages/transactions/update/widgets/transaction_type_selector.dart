import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/extensions/string.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/presentation/pages/transactions/update/state/update_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/update/state/update_transaction_state.dart';
import 'package:my_money/presentation/widgets/form_container.dart';

class TransactionTypeSelector extends StatelessWidget {
  const TransactionTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final validTransactionValues = TransactionType.values
        .where(
            (e) => e != TransactionType.none && e != TransactionType.transfer)
        .toList();

    return FormContainer(
      child: BlocBuilder<UpdateTransactionCubit, UpdateTransactionState>(
        buildWhen: (prev, next) => prev.transactionType != next.transactionType,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: validTransactionValues
                .map((e) => Expanded(
                      child: GestureDetector(
                        onTap: () => context
                            .read<UpdateTransactionCubit>()
                            .setTransactionType(e),
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          alignment: Alignment.center,
                          child: Text(
                            e.name.capitalizeFirstLetter,
                            style: context.textTheme.bodyLarge!.copyWith(
                              color: e == state.transactionType
                                  ? context.colorScheme.primary
                                  : null,
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
