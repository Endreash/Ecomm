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

  double setTotal() {
    double price = widget.item.price;
    // double price = 300;
    // print(price);
    double total;
    return total = price * _quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setQuantity(false);
              print(_quantity);
            },
            child: const Icon(
              Icons.remove,
              color: Color.fromARGB(255, 94, 239, 99),
              size: 36.0,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            _quantity.toString(),
          ),
          // Text('aa'),
          const SizedBox(
            width: 12,
          ),
          GestureDetector(
              onTap: () {
                setQuantity(true);
                print(_quantity);
              },
              child: const Icon(
                Icons.add,
                color: Colors.green,
                size: 36.0,
              )),
          // const SizedBox(width: 64),
          // Text(
          //   "${setTotal().toString()} ETB",
          // )
        ],
      ),
    );
  }
}
