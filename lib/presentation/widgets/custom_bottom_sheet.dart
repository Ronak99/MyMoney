import 'package:flutter/material.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:go_router/go_router.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final String content;
  final String actionButtonText;

  const CustomBottomSheet._({
    super.key,
    required this.title,
    required this.content,
    required this.actionButtonText,
  });

  factory CustomBottomSheet.privacy() {
    return const CustomBottomSheet._(
      title: "We take your privacy seriously",
      content:
          "This app keeps all your data on your device, none of your bank account detail or corressponding names are even read by any of our parsers, we simply look for your transactions, the amount and the receiver. Nothing more than the relevant information.",
      actionButtonText: "Awesome!",
    );
  }

  void show(BuildContext context) => showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return this;
        },
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: context.colorScheme.surface,
        ),
        child: Column(
          children: [
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
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => context.pop(),
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
