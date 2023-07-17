import 'package:flutter/material.dart';
import 'package:tools_app/models/models.dart';
import 'package:tools_app/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
      route: 'home',
      icon: Icons.list,
      name: 'Tools Home',
      screen: const HomeScreen(),
    ),
    MenuOption(
      route: 'calculator',
      icon: Icons.build_circle_sharp,
      name: 'InfinityScroll & Pull to refresh',
      screen: const CalculatorScreen(),
    )
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    for (final options in menuOptions) {
      appRoutes
          .addAll({options.route: (BuildContext context) => options.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    );
  }
}
