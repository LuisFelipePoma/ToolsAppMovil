import 'package:flutter/material.dart';
import 'package:tools_app/configuration/configurations.dart';
import 'package:tools_app/providers/providers.dart';
import 'package:tools_app/router/routes.dart';
import 'package:tools_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tools App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppTheme.lightTheme,
    );
  }
}
