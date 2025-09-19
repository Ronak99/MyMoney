import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_money/app.dart';
import 'package:my_money/packages/actions/app_action_manager.dart';
import 'package:my_money/packages/parser/parser.dart';
import 'package:my_money/packages/storage/storage.dart';
import 'package:my_money/presentation/routes/route_generator.dart';


// init router
final router = RouteGenerator.generateRoutes();

void main() async {
  // ensure binding
  WidgetsFlutterBinding.ensureInitialized();

  // init services
  await initializeServices();

  // init cubits
  RouteGenerator.initializeCubits();

  // initialize shortcuts
  AppActionManager.instance.initialize();

  // run app
  runApp(const MyMoneyApp());
}

Future<void> initializeServices() async {
  Get.put(LocalStorageService.instance);
  Get.put(BankStatementService.instance);
  await Get.find<LocalStorageService>().initialize();
}
