import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jump Time',
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: lightThemeData(),
      darkTheme: darkThemeData(),
      themeMode: ThemeMode.light, //TODO: Change Theme Mode to System
      initialRoute: Routes.home,
      routes: Routes.routes,
    );
  }
}
