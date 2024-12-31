import 'package:ecomm/src/routing/app_route.dart';
import 'package:ecomm/src/theme/app_theme.dart';
import 'package:ecomm/src/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final theme = ref.watch(themeProvider);
      return MaterialApp.router(
        // routerDelegate: goRouter.routerDelegate,
        // routeInformationParser: goRouter.routeInformationParser,
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
        restorationScopeId: 'app', // ??
        // home: const UserHomePage(),
        onGenerateTitle: (BuildContext context) => 'My Shop',
        // theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        // themeMode: theme.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        );
      }
    );
  }
}
