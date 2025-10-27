import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'features/theme_mode/presentation/controller/theme_controller.dart';

void main() {

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    
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
      themeMode: ref.watch(themeProvider),
      initialRoute: ViewRoute.home.name,
      routes: AppRoutes.routes,
    );
  }
}
