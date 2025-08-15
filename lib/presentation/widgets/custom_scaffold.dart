import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? bottomNavigationBar;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        width: double.infinity,
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
