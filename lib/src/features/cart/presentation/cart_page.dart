import 'package:ecomm/src/features/cart/presentation/cart_card.dart';
import 'package:ecomm/src/features/cart/services/cart_services.dart';
import 'package:ecomm/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final cart = ref.watch(cartProvider);
    final cartService = ref.read(cartServiceProvider);
    final cartItems = cartService.getCartItems();
    final totalCost = cartService.calculateTotalCost();

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
                  Expanded(  
                    // flex: 3,
                      child: 
                      ListView.builder(
                          // itemCount: value.getUserCart().length,
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            // get individual item
                            // Item individualItem = cart[index];
                            final individualItem = cartItems[index];
                            // final item = itemShop;
                            //return the cart item
                            // return CartItem(individualItem);
                            return CartCard(individualItem);

                          })),
                      //  const Flexible(flex: 1, child: Padding(
                      //    padding: EdgeInsets.all(16.0),
                      //    child: Column(
                      //      children: [
                      //        PromoCode(),
                             
                      //      ],
                      //    ),
                      //  ))
                      Divider(thickness: 2, color: Colors.grey[300]),
                      GestureDetector(
                        onTap: ()=> context.goNamed(AppRoute.checkout.name),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 64,
                            // width: 220,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24), color: Colors.green),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  // 'Total: $totalCost',
                                  'Checkout for \$$totalCost',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            )
          
        );
  }
}
