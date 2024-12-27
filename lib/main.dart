import 'dart:async';

import 'package:ecomm/src/app.dart';
// import 'package:ecomm/src/home_page.dart';
// import 'package:ecomm/src/models/cart.dart';
// import 'package:ecomm/src/screens/login.dart';
// import 'package:ecomm/src/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (context) => ThemeProvider(),
//     child: const MyApp(),
//   ));
// }

void main() async {
  // * For more info on error handling, see:
  // * https://docs.flutter.dev/testing/errors
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // remove the '#' from chrome url in web
    GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
    // * Entry point of the app
    runApp(const MyApp());

    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('An error occurred' // need to define localization
          // .hardcoded
          ),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    // * Log any errors to console
    debugPrint(error.toString());
  });
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => Cart(),
//       builder: (context, child) => MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: Provider.of<ThemeProvider>(context).themeData,
//       home: const Scaffold(body: MyApp()),
//       ),
      
//     );
//   }
// }
