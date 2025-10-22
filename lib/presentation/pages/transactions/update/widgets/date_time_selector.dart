import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/extensions/date.dart';
import 'package:my_money/presentation/pages/transactions/update/state/update_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/update/state/update_transaction_state.dart';
import 'package:my_money/presentation/widgets/form_container.dart';

class DateTimeSelector extends StatelessWidget {
  const DateTimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    double padding = 16;
    double ratio = 0.30;

    return FormContainer(
      padding: EdgeInsets.symmetric(
        vertical: padding * (1-ratio),
      ),
      child: BlocBuilder<UpdateTransactionCubit, UpdateTransactionState>(
        buildWhen: (prev, next) => prev.date != next.date,
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030));
                    if (selectedDate == null) return;
                    if (!context.mounted) return;
                    context
                        .read<UpdateTransactionCubit>()
                        .setDate(selectedDate);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 24,
                      top: padding * ratio,
                      bottom: padding * ratio,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: context.colorScheme.onSurface.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(state.date!.formatDate),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final selectedTime = await showTimePicker(
                        context: context, initialTime: state.date!.time);
                    if (selectedTime == null) return;
                    if (!context.mounted) return;
                    context
                        .read<UpdateTransactionCubit>()
                        .setTime(selectedTime);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 24,
                      top: padding * ratio,
                      bottom: padding * ratio,
                    ),
                    child: Text(state.date!.formatTime),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
