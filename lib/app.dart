import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/packages/storage/storage.dart';

class MyMoneyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: MaterialApp(
        home: Scaffold(
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    // Get.find<LocalStorageService>().addTransaction(transaction);
                  },
                  child: const Text("Create transaction"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
