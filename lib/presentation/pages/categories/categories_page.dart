import 'package:flutter/material.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(title: "Categories Page", body: Text("Categories"));
  }
}
