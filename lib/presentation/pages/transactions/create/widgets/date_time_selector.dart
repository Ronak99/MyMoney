import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/extensions/date.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_state.dart';

class DateTimeSelector extends StatelessWidget {
  const DateTimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTransactionCubit, CreateTransactionState>(
      buildWhen: (prev, next) => prev.date != next.date,
      builder: (context, state) {
        return Row(
          children: [
            GestureDetector(
              onTap: () async {
                final selectedDate = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2030));
                if(selectedDate == null) return;
                context.read<CreateTransactionCubit>().setDate(selectedDate);
              },
              child: Text(state.date!.formatDate),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                final selectedTime = await showTimePicker(context: context, initialTime: state.date!.time);
                if(selectedTime == null) return;
                context.read<CreateTransactionCubit>().setTime(selectedTime);
              },
              child: Text(state.date!.formatTime),
            ),
          ],
        );
      },
    );
  }
}
