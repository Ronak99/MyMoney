import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/model/transaction.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_state.dart';

class TransactionTypeSelector extends StatelessWidget {
  const TransactionTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTransactionCubit, CreateTransactionState>(
      buildWhen: (prev, next) => prev.transactionType != next.transactionType,
      builder: (context, state) {
        return Row(
          children: TransactionType.values
              .map((e) => GestureDetector(
                    onTap: () => context
                        .read<CreateTransactionCubit>()
                        .setTransactionType(e),
                    child: Row(
                      children: [
                        if (state.transactionType == e)
                          const Icon(Icons.check_circle),
                        Text(e.name),
                      ],
                    ),
                  ))
              .toList(),
        );
      },
    );
  }
}
