import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/main.dart';
import 'package:my_money/presentation/routes/route_generator.dart';
import 'package:my_money/presentation/theme/app_theme.dart';
import 'package:my_money/state/settings/settings_cubit.dart';
import 'package:my_money/state/settings/settings_state.dart';

class MyMoneyApp extends StatelessWidget {
  const MyMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: RouteGenerator.settingsCubit,
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: AppTheme().buildTheme(
              brightness: Brightness.dark,
              seedColor: state.seedColor,
            ),
          );
        },
      ),
    );
  }
}
