// import 'package:ecomm/src/constants/test_items.dart';
import 'package:ecomm/src/features/items/data/items_repository.dart';
import 'package:ecomm/src/features/items/presentation/item_page/add_to_cart.dart';
// import 'package:ecomm/src/features/item_page/item_image.dart';
import 'package:ecomm/src/features/items/presentation/item_page/rating_and_such_buttons.dart';
import 'package:ecomm/src/features/items/presentation/item_page/toogle_buttons.dart';
import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:ecomm/src/routing/app_route.dart';
import 'package:ecomm/src/widgets/favorite_button.dart';
import 'package:ecomm/src/widgets/responsive_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key, required this.itemID});
  final String itemID;

// used the Consumer rather than ConsumerWidget which rebuilds every thing in the build method
// if the the provider value changes
  @override
  Widget build(BuildContext context) { 
    // final item = itemShop.firstWhere((item) => item.id == itemID);
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipOval(
            child: Material(
              color: Colors.transparent, // Background color
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.grey[800]), // Icon
                onPressed: () => context.goNamed(AppRoute.home.name)
                // splashColor: Colors.blue.shade200, // Splash color
                // highlightColor: Colors.blue.shade300, // Highlight color
              ),
            ),
          ),
        ),
        actions: const [
          // MaterialButton(
          //   onPressed: () {},
          //   child: const Icon(Icons.favorite_border),
          // ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: FavoriteButton(),
          )
        ],
      ),
      body: Consumer( // only this builder will called again if the value returned by this provider (itemsRepositoryProvider) changes
        builder: (context, ref, child) {
          final itemsRepository = ref.watch(itemsRepositoryProvider);
          final item = itemsRepository.getItem(itemID);
          return item == null
              ?
              //TODO: Empty Placeholder Widget
              const Center(
                  child: Text(
                    'Item not found',
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    ResponsiveSliverCenter(
                      padding: const EdgeInsets.all(16),
                      child: ItemPage(
                        item: item,
                      ),
                    ),
                    // TODO Item Reviews List(itemId: itemId),
                  ],
                );
        },
      ),
    );
  }
}

class ItemPage extends StatelessWidget {
  const ItemPage({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          // Container(
          //   height: 400,
          //   decoration: BoxDecoration(
          //       color: Colors.grey[300],
          //       image: const DecorationImage(
          //           image: AssetImage('assets/xbox.png'), fit: BoxFit.cover)),
          // ),
          SizedBox(
            height: 400,
            // decoration: const BoxDecoration(
            //   color: Colors.white
            // ),
            child: Image.asset(
              item.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const RatingAndReview(),
                const SizedBox(height: 12),
                Text(
                  item.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
                const SizedBox(height: 4),
                const ToogleButtons(),
                const SizedBox(height: 4),
                Divider(thickness: 2, color: Colors.grey[300]),
                const SizedBox(height: 8),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text('\$650',
                              style: TextStyle(
                                  // color: Colors.grey,
                                  decoration: TextDecoration.lineThrough)),
                          // Text(
                          //   '\$570.00',
                          //   style: TextStyle(
                          //       fontSize: 25,
                          //       fontWeight: FontWeight.w500),
                          // )
                          Text(
                            item.price,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      // const SizedBox(width: 30),
                      AddToCart(
                        item: item,
                      )
                    ])
              ],
            ),
          )
        ],
      ),
    );
    // );
  }
}
