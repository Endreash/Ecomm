import 'package:ecomm/src/features/cart/domain/cart.dart';
import 'package:ecomm/src/features/cart/services/cart_services.dart';
import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddToCart extends ConsumerWidget {
  const AddToCart({super.key, required this.item});
  final Item item;

   // void addItemToCart() {
  //   // print('Eww! dont touch me');
  //   // Provider.of<Cart>(context, listen: false).addItemToCart(widget.item);
    

  //   showDialog(
  //       context: context,
  //       builder: (context) => const AlertDialog(
  //             title: Text('Succsessfully added'),
  //             content: Text('Check your cart'),
  //           ));
  // }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final cart = ref.watch(cartProvider);
    final cartService = ref.read(cartServiceProvider);
    return 
      // TODO: available quantity
      GestureDetector(
        onTap: () => {
          // ref.read(cartProvider.notifier).add(item),
          cartService.addItemToCart(item),

          print('Ehe! Right there.')
        },
        child: Container(
          height: 64,
          width: 220,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24), color: Colors.green),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Add to cart',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      );
  }
}
