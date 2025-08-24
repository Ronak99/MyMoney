import 'package:flutter/material.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/presentation/routes/routes.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final String content;
  final String actionButtonText;
  final double? height;
  final Widget? child;
  final Function(BuildContext context) onActionButtonPressed;

  const CustomBottomSheet._({
    super.key,
    required this.title,
    this.child,
    required this.content,
    required this.actionButtonText,
    required this.onActionButtonPressed,
    this.height,
  });

  factory CustomBottomSheet.privacy() {
    return CustomBottomSheet._(
      title: "Privacy Matters!",
      content:
          "This app keeps all your data on your device, none of your bank account detail or corressponding names are even read by any of our parsers, we simply look for your transactions, the amount and the receiver. Nothing more than the relevant information.",
      actionButtonText: "Awesome!",
      height: 350,
      onActionButtonPressed: (context) => context.pop(),
    );
  }

  factory CustomBottomSheet.noBankAccount() {
    return CustomBottomSheet._(
      title: "No Bank Account!",
      content: "You must add a bank account to proceed further.",
      actionButtonText: "Add bank account",
      height: 250,
      onActionButtonPressed: (context) =>
          context.push(Routes.MODIFY_ACCOUNT.value),
    );
  }

  factory CustomBottomSheet.pdfLocked() {
    final TextEditingController textEditingController = TextEditingController();

    return CustomBottomSheet._(
      title: "Locked PDF!",
      content: "The PDF you uploaded is locked, please provide a password.",
      actionButtonText: "Alohomora",
      height: 300,
      onActionButtonPressed: (context) =>
          textEditingController.text.trim().isEmpty
              ? null
              : context.pop(textEditingController.text),
      child: TextField(
        controller: textEditingController,
        decoration: const InputDecoration(
          hintText: "Password",
        ),
      ),
    );
  }

  factory CustomBottomSheet.wrongPassword({required String previousPassword}) {
    final TextEditingController textEditingController = TextEditingController();

    return CustomBottomSheet._(
      title: "Wrong Password!",
      content: "$previousPassword is incorrect. Please try again.",
      actionButtonText: "Alohomora",
      height: 300,
      onActionButtonPressed: (context) =>
          textEditingController.text.trim().isEmpty
              ? null
              : context.pop(textEditingController.text),
      child: TextField(
        controller: textEditingController,
        decoration: const InputDecoration(
          hintText: "Password",
        ),
      ),
    );
  }

  Future<T?> show<T>(BuildContext context) => showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return this;
        },
      );

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
        child: Column(
          children: [
            // the handle: might need it in the future.
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.grey,
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   margin: const EdgeInsets.symmetric(vertical: 12),
            //   height: 4,
            //   width: 100,
            // ),
            // const SizedBox(height: 4),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: context.colorScheme.primary.withOpacity(.1),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: context.textTheme.titleLarge),
                    const SizedBox(height: 16),
                    Text(
                      content,
                      style: context.textTheme.bodyMedium!.copyWith(
                        height: 1.6,
                      ),
                    ),
                    if (child != null)
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: child,
                      ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => onActionButtonPressed(context),
                        child: Text(actionButtonText),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
