import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/extensions/string.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/routes/routes.dart';

class CustomBottomSheet extends StatefulWidget {
  final String? title;
  final String? content;
  final String actionButtonText;
  final double? height;
  final Widget? child;
  final Function(BuildContext context) onActionButtonPressed;

  const CustomBottomSheet._({
    super.key,
    this.title,
    this.child,
    this.content,
    required this.actionButtonText,
    required this.onActionButtonPressed,
    this.height,
  });

  static final _heightOffset = ValueNotifier<double>(0);

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

  factory CustomBottomSheet.modifyAccount({Account? account}) {
    final formKey = GlobalKey<FormState>();
    String? accountName = account?.name;
    double balance = account?.balance ?? 0;

    return CustomBottomSheet._(
      title: null,
      actionButtonText: account == null ? "Create Account" : "Update Account",
      height: 275,
      onActionButtonPressed: (context) {
        final result = formKey.currentState!.validateGranularly();
        _heightOffset.value = result.length * 15;

        if (result.isNotEmpty) return;

        formKey.currentState!.save();

        RouteGenerator.accountCubit.addAccount(
          Account(
              name: accountName!, balance: balance, createdOn: DateTime.now()),
        );

        context.pop();
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: accountName,
              validator: (value) => value != null && value.trim().isEmpty
                  ? "Please provide an account name"
                  : null,
              decoration: const InputDecoration(
                hintText: "Account Name",
              ),
              onSaved: (value) {
                accountName = value!;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: balance.toString(),
              validator: (value) => value != null && value.trim().isEmpty
                  ? "Please provide an initial amount"
                  : null,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Initial Balance",
              ),
              onSaved: (value) {
                balance = double.parse(value!);
              },
            ),
          ],
        ),
      ),
    );
  }

  factory CustomBottomSheet.modifyCategory({TransactionCategory? category}) {
    final formKey = GlobalKey<FormState>();
    String? name = category?.name;
    String? description = category?.description;
    final categoryTypeNotifier =
        ValueNotifier<CategoryType>(category?.type ?? CategoryType.expense);

    return CustomBottomSheet._(
      title: null,
      actionButtonText:
          category == null ? "Create Category" : "Update Category",
      height: 375,
      onActionButtonPressed: (context) {
        final result = formKey.currentState!.validateGranularly();
        _heightOffset.value = result.length * 15;

        if (result.isNotEmpty) return;

        formKey.currentState!.save();

        RouteGenerator.categoryCubit.addCategory(
          TransactionCategory(
            name: name!,
            description: description!,
            type: categoryTypeNotifier.value,
            createdOn: DateTime.now(),
          ),
        );

        context.pop();
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: categoryTypeNotifier,
              builder: (context, categoryType, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: CategoryType.values
                      .map((e) => Expanded(
                    child: GestureDetector(
                      onTap: () => categoryTypeNotifier.value = e,
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        padding:
                        const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        child: Text(
                          e.name.capitalizeFirstLetter,
                          style: context.textTheme.bodyLarge!.copyWith(
                            color: e == categoryType
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
            const SizedBox(height: 16),
            TextFormField(
              initialValue: name,
              validator: (value) => value != null && value.trim().isEmpty
                  ? "Please provide a category name"
                  : null,
              decoration: const InputDecoration(
                hintText: "Category Name",
              ),
              onSaved: (value) {
                name = value!;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: description,
              maxLines: 2,
              validator: (value) => value != null && value.trim().isEmpty
                  ? "Please provide a description"
                  : null,
              decoration: const InputDecoration(
                hintText: "Description",
              ),
              onSaved: (value) {
                description = value!;
              },
            ),
          ],
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
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  void dispose() {
    CustomBottomSheet._heightOffset.value = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CustomBottomSheet._heightOffset,
      builder: (context, value, static) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(16),
          height: widget.height != null ? widget.height! + value : null,
          child: static,
        );
      },
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
                    if (widget.title != null)
                      Text(widget.title!, style: context.textTheme.titleLarge),
                    if (widget.content != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        widget.content!,
                        style: context.textTheme.bodyMedium!.copyWith(
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    if (widget.child != null) widget.child!,
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => widget.onActionButtonPressed(context),
                        child: Text(widget.actionButtonText),
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
