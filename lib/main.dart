import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_money/app.dart';
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

  // run app
  runApp(MyMoneyApp());
}

Future<void> initializeServices() async {
  Get.put(LocalStorageService.instance);
  await Get.find<LocalStorageService>().initialize();
}
