import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/constants/constants.dart';
import 'package:my_money/enums/category_icon.dart';
import 'package:my_money/extensions/category_icon.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/account_and_category_selector.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/amount_field.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/date_time_selector.dart';
import 'package:my_money/presentation/pages/transactions/create/widgets/transaction_type_selector.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';

class CreateTransactionPage extends StatelessWidget {
  const CreateTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Create",
      trailing: TextButton(
        onPressed: () {
          context.read<CreateTransactionCubit>().create();
          context.pop(context);
        },
        child: const Text("Save"),
      ),
      onBackButtonPressed: context.pop,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          // select transaction type
          const TransactionTypeSelector(),

          const SizedBox(height: kVerticalSpacing),

          // account and category selector
          const AccountAndCategorySelector(),

          const SizedBox(height: kVerticalSpacing),

          // date
          const DateTimeSelector(),

          const SizedBox(height: kVerticalSpacing),

          // amount
          CustomTextField(
            hint: "Amount",
            onChange: context.read<CreateTransactionCubit>().setAmount,
          ),

          const SizedBox(height: kVerticalSpacing),

          // name
          CustomTextField(
            hint: "Notes",
            onChange: context.read<CreateTransactionCubit>().setNotes,
            maxLines: 4,
          ),

          const SizedBox(height: kVerticalSpacing),

          Center(
            child: Builder(
              builder: (context) {
                double iconSize = 80;
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: iconSize,
                      width: iconSize,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    ClipPath(
                      clipper: BottomHalfClipper(),
                      child: Container(
                        height: iconSize,
                        width: iconSize,
                        child: Image.asset(CategoryIcon.values[6].assetName)
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}

class BottomHalfClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(size.width * .1, size.height / 2);

    // create an arc to size.height / 2
    path.arcToPoint(
      Offset(size.width * .9, size.height / 2),
      radius: const Radius.circular(30),
      clockwise: false,
    );

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true; // Reclip whenever the widget rebuilds
  }
}
