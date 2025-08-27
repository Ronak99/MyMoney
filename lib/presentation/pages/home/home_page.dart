import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_money/presentation/routes/routes.dart';
import 'package:my_money/presentation/widgets/custom_scaffold.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouter.of(context).state.matchedLocation;

    List<Routes> tabBarRoutes = [
      Routes.TRANSACTIONS,
      // Routes.ANALYSIS,
      Routes.IMPORT,
      Routes.ACCOUNTS,
      // Routes.SETTINGS
    ];

    int currentIndex =
        tabBarRoutes.map((e) => e.value).toList().indexOf(currentLocation);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          try {
            context.pushReplacement(tabBarRoutes.toList()[index].value);
          } catch (e) {
            throw Exception("Error on tab change: ${e}");
          }
        },
        currentIndex: currentIndex < 0 ? 0 : currentIndex,
        items: tabBarRoutes
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(
                  switch (e) {
                    Routes.TRANSACTIONS =>
                      CupertinoIcons.money_dollar_circle_fill,
                    Routes.ANALYSIS => CupertinoIcons.graph_circle_fill,
                    Routes.IMPORT => CupertinoIcons.cloud_download_fill,
                    Routes.ACCOUNTS => Icons.wallet,
                    Routes.SETTINGS => CupertinoIcons.settings,
                    _ => null,
                  },
                ),
                label: e.name,
              ),
            )
            .toList(),
      ),
    );
  }
}
