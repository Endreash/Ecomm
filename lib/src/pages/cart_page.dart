// import 'package:ecomm/src/models/cart.dart';
import 'package:ecomm/src/constants/test_items.dart';
import 'package:ecomm/src/models/item_model.dart';
import 'package:ecomm/src/util/cart_item.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  
  @override
  Widget build(BuildContext context) {

  var item = itemShop;
  //   List<Item> itemShop = [
  //   Item(
  //       name: 'Airpods',
  //       price: '132.0',
  //       rating: '4.9',
  //       imagePath: 'assets/airpod.png'
  //       ),
  //   Item(
  //       name: 'Macbook Air 13',
  //       price: '1100.00',
  //       rating: '5.0',
  //       imagePath: 'assets/macbook-pro.png'),
  //   Item(
  //       name: 'iPhone 13 pro max',
  //       price: '599.0',
  //       rating: '4.7',
  //       imagePath: 'assets/iPhone13.png'),
  //   Item(
  //       name: 'iPhone 13 pro max',
  //       price: '599.0',
  //       rating: '4.7',
  //       imagePath: 'assets/iPhone13.png'),
  // ];

    return 
    // Consumer<Cart>(
    //     builder: (context, value, child) => 
        Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
              // leading: Container(
              //   padding: const EdgeInsets.all(2),
              //   decoration: BoxDecoration(
              //     border:
              //         Border.all(color:const Color.fromARGB(255, 186, 185, 185)),
              //     borderRadius: const BorderRadius.all(Radius.circular(50)),
              //   ),
              //   child: const BackButton(color: Colors.black),
              //   ),
                title: const Text(
                  'My cart',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                actions: [
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: const Color.fromARGB(255, 186, 185, 185)),
                        borderRadius: const BorderRadius.all(Radius.circular(50))
                        ),
                      child: const Icon(Icons.more_horiz, color: Colors.black)),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        // itemCount: value.getUserCart().length,
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          // get individual item
                          Item individualItem =item[index];
                          //return the cart item
                          return CartItem(individualItem);
                        }))
                  ],
                ),
              ));
            // ));
  }
}
