import 'package:flutter/material.dart';
import 'package:my_money/main.dart';
import 'package:my_money/presentation/theme/app_theme.dart';

class MyMoneyApp extends StatelessWidget {
  const MyMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().buildTheme(brightness: Brightness.dark),
    );
  }
}
