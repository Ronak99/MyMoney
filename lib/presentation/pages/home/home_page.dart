import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/presentation/routes/routes.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final tabBarRoutes = [Routes.TRANSACTIONS, Routes.ACCOUNTS, Routes.CATEGORIES];
    final currentLocation = GoRouter.of(context).state.matchedLocation;

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          try {
            context.pushReplacement(tabBarRoutes[index].value);
          } catch (e) {
            print(e);
          }
        },
        currentIndex: tabBarRoutes.map((e) => e.value).toList().indexOf(currentLocation),
        items: tabBarRoutes
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(
                    switch(e) {
                      Routes.TRANSACTIONS => Icons.money,
                      Routes.ACCOUNTS => Icons.person,
                      Routes.CATEGORIES => Icons.list,
                    }
                ),
                label: e.name,
              ),
            )
            .toList(),
      ),
    );
  }
}
