import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_money/app.dart';
import 'package:my_money/packages/storage/storage.dart';

void main() {
  initializeServices();
  runApp(MyMoneyApp());
}

void initializeServices() {
  Get.put(LocalStorageService.instance);
}
