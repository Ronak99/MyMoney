import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/presentation/pages/home_page.dart';
import 'package:my_money/presentation/routes/routes.dart';
import 'package:my_money/state/account/account_cubit.dart';
import 'package:go_router/go_router.dart';

class RouteGenerator {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext? get context => rootNavigatorKey.currentContext;

  static late AccountCubit accountCubit;

  static void initializeCubits() {
    accountCubit = AccountCubit();
  }

  static GoRouter generateRoutes() {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: Routes.HOME.value,
      routes: [
        GoRoute(
          path: Routes.HOME.value,
          builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: accountCubit),
            ],
            child: const HomePage(),
          ),
        ),
      ],
    );
  }
}
