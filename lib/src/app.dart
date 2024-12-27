import 'package:ecomm/src/features/items_list/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        )
    ]);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app', // ??
      // home: const UserHomePage(),
      onGenerateTitle: (BuildContext context) => 'My Shop',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
        ),
      ),
      );
  }
}
