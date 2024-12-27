// import 'package:ecomm/src/constants/test_items.dart';
// import 'package:ecomm/src/features/items_list/categories_link.dart';
// import 'package:ecomm/src/features/items_list/discount_sale_container.dart';
import 'package:ecomm/src/features/items_list/items_grid.dart';
import 'package:ecomm/src/features/items_list/items_search.dart';
import 'package:ecomm/src/routing/app_route.dart';
// import 'package:ecomm/src/models/cart.dart';
// import 'package:ecomm/src/models/item_model.dart';
// import 'package:ecomm/src/pages/cart_page.dart';
// import 'package:ecomm/src/features/items_list/item_card.dart';
// import 'package:ecomm/src/util/category_slide.dart';
import 'package:ecomm/src/widgets/responsive_center.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // * Use a [ScrollController] to register a listener that dismisses the
  // * on-screen keyboard when the user scrolls.
  // * This is needed because this page has a search field that the user can
  // * type into.
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
    // var items = itemShop;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey,
          title: const Text('Discover'),
          centerTitle: false,
          actions: [
            MaterialButton(
              // onPressed: () => GoRouter.of(context).go('/cart'),
              onPressed: () => context.pushNamed(AppRoute.cart.name), // using pushNamed so that it can go back to the previous stack not to '/'
              child: const Icon(Icons.shopping_bag_outlined),
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
        
            ResponsiveSliverCenter(
              padding: EdgeInsets.all(16),
              child: ItemsGrid())
            // ListView.builder(
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     scrollDirection: Axis.vertical,
            //     itemCount: items.length,
            //     itemBuilder: (context, index) {
            //       Item item = items[index];
            //       return ItemCard(item
            //           // items[index][0], items[index][1], items[index][2], items[index][3]
            //           );
            //     })
          ]),
        );
  }
}
