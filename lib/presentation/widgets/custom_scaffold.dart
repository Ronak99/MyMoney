import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final Widget? fab;
  final Widget? bottomNavigationBar;
  final Widget? leading;
  final Widget? trailing;

  const CustomScaffold({
    super.key,
    this.title,
    required this.body,
    this.fab,
    this.leading,
    this.trailing,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title != null ? Text(title!) : null,
        leading: leading,
        actions: [
          if (trailing != null) ...[trailing!, const SizedBox(width: 16)]
        ],
      ),
      floatingActionButton: fab,
      body: SizedBox(
        width: double.infinity,
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
