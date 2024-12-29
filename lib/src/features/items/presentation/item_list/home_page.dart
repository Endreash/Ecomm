import 'package:ecomm/src/features/items/presentation/item_list/cart_icon.dart';
import 'package:ecomm/src/features/items/presentation/item_list/discount_sale_container.dart';
import 'package:ecomm/src/features/items/presentation/item_list/items_grid.dart';
import 'package:ecomm/src/features/items/presentation/item_list/items_search.dart';
import 'package:ecomm/src/routing/app_route.dart';
import 'package:ecomm/src/widgets/responsive_center.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Use a [ScrollController] to register a listener that dismisses the
  // on-screen keyboard when the user scrolls.
  // This is needed because this page has a search field that the user can type into.
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_dismissOnScreenKeyboard);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_dismissOnScreenKeyboard);
    super.dispose();
  }

  // When the search text field gets the focus, the keyboard appears on mobile.
  // This method is used to dismiss the keyboard when the user scrolls.
  void _dismissOnScreenKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: const Text('Discover', style: TextStyle(
            color: Colors.grey
          ),),
          centerTitle: false,
          actions: [
            MaterialButton(
              splashColor: Colors.transparent, // Remove splash effect
              highlightColor: Colors.transparent, // Remove highlight effect
              hoverColor: Colors.transparent, // Remove hover effect
              // color: Colors.white, // Background color
              // textColor: Colors.grey, // Text color
              // onPressed: () => GoRouter.of(context).go('/cart'),
              onPressed: () => context.pushNamed(AppRoute.cart.name), // using pushNamed so that it can go back to the previous stack not to '/'
              // child: const Icon(Icons.shopping_bag_outlined),
              child: const CartIcon(),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: const [
            ResponsiveSliverCenter(
              padding: EdgeInsets.all(16),
              child: SearchItems()),

            ResponsiveSliverCenter(child: Padding(
              padding: EdgeInsets.all(16.0),
              child: DiscountSaleContainer(),
            )),
        
            ResponsiveSliverCenter(
              // padding: EdgeInsets.all(16),
              child: ItemsGrid())
          ]),
        );
  }
}
