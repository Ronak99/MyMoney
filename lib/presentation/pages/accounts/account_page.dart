import 'package:flutter/material.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Account Page',
      body: Text('Account Page'),
    );
  }
}
