import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/enums/category_icon.dart';
import 'package:my_money/enums/category_type.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/extensions/category_icon.dart';
import 'package:my_money/extensions/string.dart';
import 'package:my_money/model/account.dart';
import 'package:my_money/model/transaction_category.dart';
import 'package:my_money/presentation/pages/accounts/widgets/account_list_item.dart';
import 'package:my_money/presentation/pages/categories/widgets/category_list_item.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/widgets/form_container.dart';
import 'package:my_money/presentation/widgets/list_view_separated.dart';
import 'package:my_money/state/account/account_cubit.dart';
import 'package:my_money/state/account/account_state.dart';
import 'package:my_money/state/category/category_cubit.dart';
import 'package:my_money/state/category/category_state.dart';

class CustomBottomSheet extends StatefulWidget {
  final String? title;
  final String? content;
  final String actionButtonText;
  final double height;
  final Widget? child;
  final Function(BuildContext context)? onActionButtonPressed;

  const CustomBottomSheet._({
    this.title,
    this.child,
    this.content,
    required this.actionButtonText,
    this.onActionButtonPressed,
    required this.height,
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
      onActionButtonPressed: (context) => {},
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
      onActionButtonPressed: (context) async {
        final result = formKey.currentState!.validateGranularly();
        _heightOffset.value = result.length * 15;

        if (result.isNotEmpty) return;

        formKey.currentState!.save();

        final createdAccount = await RouteGenerator.accountCubit.addAccount(
          Account(
            name: accountName!,
            balance: balance,
            createdOn: DateTime.now(),
          ),
        );

        if (!context.mounted) return;
        context.pop(createdAccount);
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
    final categoryTypeNotifier =
        ValueNotifier<CategoryType>(category?.type ?? CategoryType.expense);
    final categoryIconNotifier =
        ValueNotifier<CategoryIcon>(category?.icon ?? CategoryIcon.unknown);

    return CustomBottomSheet._(
      title: null,
      actionButtonText:
          category == null ? "Create Category" : "Update Category",
      height: 500,
      onActionButtonPressed: (context) async {
        final result = formKey.currentState!.validateGranularly();
        _heightOffset.value = result.length * 15;

        if (result.isNotEmpty) return;

        formKey.currentState!.save();

        final category = await RouteGenerator.categoryCubit.addCategory(
          TransactionCategory(
            name: name!,
            type: categoryTypeNotifier.value,
            createdOn: DateTime.now(),
            icon: categoryIconNotifier.value,
          ),
        );

        if (!context.mounted) return;
        context.pop(category);
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: categoryTypeNotifier,
              builder: (context, categoryType, child) {
                return FormContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: CategoryType.values
                        .map(
                          (e) => Expanded(
                            child: GestureDetector(
                              onTap: () => categoryTypeNotifier.value = e,
                              behavior: HitTestBehavior.translucent,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                alignment: Alignment.center,
                                child: Text(
                                  e.name.capitalizeFirstLetter,
                                  style: context.textTheme.bodyMedium!.copyWith(
                                    color: e == categoryType
                                        ? context.colorScheme.primary
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
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
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: CategoryIcon.values.length,
                itemBuilder: (context, index) {
                  CategoryIcon item = CategoryIcon.values[index];

                  return GestureDetector(
                    onTap: () => categoryIconNotifier.value = item,
                    behavior: HitTestBehavior.translucent,
                    child: ValueListenableBuilder(
                      valueListenable: categoryIconNotifier,
                      builder: (context, categoryIcon, child) =>
                          AnimatedContainer(
                        padding: const EdgeInsets.all(16),
                        duration: const Duration(milliseconds: 150),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: categoryIcon == item
                                ? context.colorScheme.primary.withOpacity(.1)
                                : Colors.transparent,
                            border: Border.all(
                              color: categoryIcon == item
                                  ? context.colorScheme.primary.withOpacity(.3)
                                  : Colors.transparent,
                            )),
                        child: child,
                      ),
                      child: Image.asset(item.assetName),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  factory CustomBottomSheet.selectAccount({Account? account}) {
    return CustomBottomSheet._(
      title: null,
      actionButtonText: "Create New Account",
      height: 275,
      onActionButtonPressed: (context) async {
        await CustomBottomSheet.modifyAccount().show(context);
        if (!context.mounted) return;
      },
      child: BlocBuilder<AccountCubit, AccountState>(
        bloc: RouteGenerator.accountCubit,
        builder: (context, state) {
          return ListViewSeparated<Account>(
            list: state.accounts,
            itemBuilder: (context, _, account) {
              return AccountListItem(
                account: account,
                onTap: () => context.pop(account),
              );
            },
          );
        },
      ),
    );
  }

  factory CustomBottomSheet.selectCategory({TransactionCategory? category}) {
    return CustomBottomSheet._(
      title: null,
      actionButtonText: "Create New Category",
      height: 275,
      onActionButtonPressed: (context) async {
        await CustomBottomSheet.modifyCategory().show(context);
        if (!context.mounted) return;
      },
      child: BlocBuilder<CategoryCubit, CategoryState>(
        bloc: RouteGenerator.categoryCubit,
        builder: (context, state) {
          return ListViewSeparated<TransactionCategory>(
            list: state.categories,
            itemBuilder: (context, _, category) {
              return CategoryListItem(
                category: category,
                onTap: () => context.pop(category),
              );
            },
          );
        },
      ),
    );
  }

  Future<T?> show<T>(BuildContext context) => showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
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
          height: widget.height + value,
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
                    if (widget.child != null)
                      Expanded(child: widget.child!)
                    else
                      const Spacer(),
                    if (widget.onActionButtonPressed != null)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () =>
                              widget.onActionButtonPressed!(context),
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
