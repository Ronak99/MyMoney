import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/presentation/pages/accounts/account_page.dart';
import 'package:my_money/presentation/pages/categories/categories_page.dart';
import 'package:my_money/presentation/pages/home/home_page.dart';
import 'package:my_money/presentation/pages/transactions/create/create_transaction_page.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/transactions_page.dart';
import 'package:my_money/presentation/routes/routes.dart';
import 'package:my_money/state/account/account_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/state/category/category_cubit.dart';
import 'package:my_money/state/transaction/transaction_cubit.dart';

class RouteGenerator {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext? get context => rootNavigatorKey.currentContext;

  static late AccountCubit accountCubit;
  static late TransactionCubit transactionCubit;
  static late CategoryCubit categoryCubit;

  static void initializeCubits() {
    accountCubit = AccountCubit();
    transactionCubit = TransactionCubit();
    categoryCubit = CategoryCubit();
  }

  static Widget _build(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: accountCubit),
        BlocProvider.value(value: transactionCubit),
        BlocProvider.value(value: categoryCubit),
      ],
      child: child,
    );
  }

  static GoRouter generateRoutes() {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: Routes.TRANSACTIONS.value,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, child) {
            return _build(HomePage(child: child));
          },
          branches: [Routes.TRANSACTIONS, Routes.ACCOUNTS, Routes.CATEGORIES]
              .map(
                (e) => StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: e.value,
                      builder: (BuildContext context, GoRouterState state) =>
                          switch (e) {
                        Routes.TRANSACTIONS => const TransactionsPage(),
                        Routes.ACCOUNTS => const AccountPage(),
                        Routes.CATEGORIES => const CategoriesPage(),
                        _ => const SizedBox.shrink(),
                      },
                    ),
                  ],
                ),
              )
              .toList(),
        ),
        GoRoute(
          path: Routes.CREATE_TRANSACTION.value,
          builder: (context, state) => BlocProvider(
            lazy: false,
            create: (context) => CreateTransactionCubit(),
            child: const CreateTransactionPage(),
          ),
        ),
      ],
    );
  }
}