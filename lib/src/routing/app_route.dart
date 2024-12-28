import 'package:ecomm/src/features/items/presentation/item_list/home_page.dart';
import 'package:ecomm/src/features/items/presentation/item_page/item_page.dart';
import 'package:ecomm/src/features/cart/presentation/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  cart,
  item
}
final goRouter = GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path:'item/:id',
              name: AppRoute.item.name,
              builder: (context, state) {
                final itemId = state.pathParameters['id']!;
                return ItemScreen(itemID: itemId);
              }
              ),
            GoRoute(
              path: 'cart', // subroutes must not start with '/'
              name: AppRoute.cart.name,
              // builder: (context, state) => const CartPage(),
              pageBuilder: (context, state) => MaterialPage( // for page transition
                key: state.pageKey,
                fullscreenDialog: true,
                child: const CartPage()
              )
            ),
          ],
        ),
    ],
    //TODO: implement not gound page
    //errorBuilder: (context, state) => const NotFounScreen() 
    );