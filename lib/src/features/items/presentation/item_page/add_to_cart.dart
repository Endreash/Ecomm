import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key, required this.item});
  final Item item;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {

  void addItemToCart() {
    // print('Eww! dont touch me');
    // Provider.of<Cart>(context, listen: false).addItemToCart(widget.item);
    
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Succsessfully added'),
              content: Text('Check your cart'),
            ));
  }
  
  @override
  Widget build(BuildContext context) {
    return 
      // TODO: available quantity
      GestureDetector(
        onTap: () => addItemToCart(),
        child: Container(
          height: 64,
          width: 220,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24), color: const Color.fromRGBO(91, 192, 109, 5)),
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
