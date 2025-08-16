import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/presentation/routes/routes.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final tabBarRoutesMap = {
      Routes.TRANSACTIONS: Routes.TRANSACTIONS.value,
      Routes.ACCOUNTS: Routes.ACCOUNTS.value,
      Routes.CATEGORIES: Routes.CATEGORIES.value,
    };
    final currentLocation = GoRouter.of(context).state.matchedLocation;

    int currentIndex = tabBarRoutesMap.values.toList().indexOf(currentLocation);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          try {
            context.pushReplacement(tabBarRoutesMap.values.toList()[index]);
          } catch (e) {
            throw Exception("Error on tab change: ${e}");
          }
        },
        currentIndex: currentIndex < 0 ? 0 : currentIndex,
        items: tabBarRoutesMap.keys
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(switch (e) {
                  Routes.TRANSACTIONS => Icons.money,
                  Routes.ACCOUNTS => Icons.person,
                  Routes.CATEGORIES => Icons.list,
                  _ => null,
                }),
                label: e.name,
              ),
            )
            .toList(),
      ),
    );
  }
}
