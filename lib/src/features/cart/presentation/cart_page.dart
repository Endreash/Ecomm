import 'package:ecomm/src/features/cart/domain/cart.dart';
import 'package:ecomm/src/features/cart/presentation/cart_card.dart';
import 'package:ecomm/src/features/cart/presentation/promo_code.dart';
import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:ecomm/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final cart = ref.watch(cartProvider);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
                ),),),),
          title: Text(
            'My cart',
            style: TextStyle(color: Colors.grey[800], fontSize: 20, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          actions: [
            MaterialButton(
              splashColor: Colors.transparent, // Remove splash effect
              highlightColor: Colors.transparent, // Remove highlight effect
              hoverColor: Colors.transparent,
              onPressed: () {},
              child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      // color: Colors.grey,
                      border: Border.all(
                          color: const Color.fromARGB(255, 186, 185, 185)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: const Icon(Icons.more_horiz, color: Colors.black)),
            )
          ],
        ),
        body: //TODO: check if cart is empty
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Flexible(  
                    flex: 3,
                      child: ListView.builder(
                          // itemCount: value.getUserCart().length,
                          itemCount: cart.length,
                          itemBuilder: (context, index) {
                            // get individual item
                            Item individualItem = cart[index];
                            // final item = itemShop;
                            //return the cart item
                            // return CartItem(individualItem);
                            return CartCard(individualItem);
                          })),
                       const Flexible(flex: 1, child: Padding(
                         padding: EdgeInsets.all(16.0),
                         child: Column(
                           children: [
                             PromoCode(),
                             
                           ],
                         ),
                       ))
                ],
              ),
            )
          
        );
  }
}
