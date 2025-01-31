import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:flutter/material.dart';

class ItemQuantitySelector extends StatefulWidget {
  final Item item;

  const ItemQuantitySelector(this.item, {super.key});

  @override
  State<ItemQuantitySelector> createState() => _ItemQuantitySelectorState();
}

class _ItemQuantitySelectorState extends State<ItemQuantitySelector> {

  int _quantity = 1;

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      // _quantity = checkQuantity(_quantity + 1);
      _quantity = _quantity + 1;
    } else {
      _quantity = _quantity - 1;
    }
    setState(() {});
  }

  // double setTotal() {
  //   double price = widget.item.price;
  //   // double price = 300;
  //   // print(price);
  //   double total;
  //   return total = price * _quantity;
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // GestureDetector(
        //   onTap: () {
        //     setQuantity(false);
        //     print(_quantity);
        //   },
        //   child: const Icon(
        //     Icons.remove,
        //     color: Colors.green,
        //     size: 20.0,
        //   ),
        // ),
        IconButton(
              icon: const Icon(Icons.remove, color: Colors.green), // Icon
              onPressed: () => {
                setQuantity(false)
              },
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent, 
              highlightColor: Colors.transparent, 
            ),
        const SizedBox(
          width: 4,
        ),
        Text(
          _quantity.toString(),
        ),
        const SizedBox(
          width: 4,
        ),
        IconButton(
              icon: const Icon(Icons.add, color: Colors.green), // Icon
              onPressed: () => {
                setQuantity(true)
              },
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent, 
              highlightColor: Colors.transparent, 
            ),
        // const SizedBox(width: 64),
        // Text(
        //   "${setTotal().toString()} ETB",
        // )
      ],
    );
  }
}
