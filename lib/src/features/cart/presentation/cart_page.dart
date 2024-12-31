// import 'package:ecomm/src/models/cart.dart';
import 'package:ecomm/src/constants/test_items.dart';
import 'package:ecomm/src/features/cart/presentation/cart_card.dart';
import 'package:ecomm/src/features/cart/presentation/promo_code.dart';
import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:ecomm/src/features/cart/presentation/cart_item.dart';
import 'package:ecomm/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var item = itemShop;

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
              ),
            ),
          ),
        ),
          // leading: Container(
          //   padding: const EdgeInsets.all(2),
          //   decoration: BoxDecoration(
          //     border:
          //         Border.all(color:const Color.fromARGB(255, 186, 185, 185)),
          //     borderRadius: const BorderRadius.all(Radius.circular(50)),
          //   ),
          //   child: const BackButton(color: Colors.black),
          //   ),
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
        body: 
        // Padding(
        //   padding: const EdgeInsets.all(12),
        //   child: Column(
        //     children: [

        //     ],
        //   ),
        //   )
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Flexible(  
                    flex: 3,
                      child: ListView.builder(
                          // itemCount: value.getUserCart().length,
                          itemCount: item.length,
                          itemBuilder: (context, index) {
                            // get individual item
                            Item individualItem = item[index];
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
