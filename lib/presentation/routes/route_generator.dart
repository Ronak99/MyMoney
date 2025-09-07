import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/extensions/build_context.dart';
import 'package:my_money/presentation/pages/accounts/account_page.dart';
import 'package:my_money/presentation/pages/categories/categories_page.dart';
import 'package:my_money/presentation/pages/home/home_page.dart';
import 'package:my_money/presentation/pages/import/import_page.dart';
import 'package:my_money/presentation/pages/import/state/import_cubit.dart';
import 'package:my_money/presentation/pages/import/view/view_imports_page.dart';
import 'package:my_money/presentation/pages/transactions/create/create_transaction_page.dart';
import 'package:my_money/presentation/pages/transactions/create/state/create_transaction_cubit.dart';
import 'package:my_money/presentation/pages/transactions/transactions_page.dart';
import 'package:my_money/presentation/routes/routes.dart';
import 'package:my_money/state/account/account_cubit.dart';
import 'package:my_money/state/category/category_cubit.dart';
import 'package:my_money/state/transaction/transaction_cubit.dart';

class RouteGenerator {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext? get context => rootNavigatorKey.currentContext;

  static double get safeAreaHeight => context!.safeAreaHeight;

  static late AccountCubit accountCubit;
  static late TransactionCubit transactionCubit;
  static late CategoryCubit categoryCubit;
  static late ImportCubit importCubit;

  static void initializeCubits() {
    accountCubit = AccountCubit();
    transactionCubit = TransactionCubit();
    categoryCubit = CategoryCubit();
    importCubit = ImportCubit();
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
          branches: [
            Routes.TRANSACTIONS,
            // Routes.ANALYSIS,
            Routes.IMPORT,
            Routes.ACCOUNTS,
            Routes.CATEGORIES,
            // Routes.SETTINGS
          ]
              .map(
                (e) => StatefulShellBranch(
                  routes: <RouteBase>[
                    GoRoute(
                      path: e.value,
                      builder: (BuildContext context, GoRouterState state) =>
                          switch (e) {
                        Routes.TRANSACTIONS => const TransactionsPage(),
                        Routes.ACCOUNTS => const AccountsPage(),
                        Routes.CATEGORIES => const CategoriesPage(),
                        Routes.IMPORT => BlocProvider.value(
                            value: importCubit,
                            child: const ImportPage(),
                          ),
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
            lazy: true,
            create: (context) => CreateTransactionCubit(
                transaction:
                    (state.extra as CreateTransactionParams).transaction,),
            child: CreateTransactionPage(
              params: state.extra as CreateTransactionParams,
            ),
          ),
        ),
        GoRoute(
          path: Routes.VIEW_IMPORTS.value,
          builder: (context, state) => BlocProvider.value(
            value: importCubit,
            child: const ViewImportsPage(),
          ),
        ),
      ],
    );
  }
}
