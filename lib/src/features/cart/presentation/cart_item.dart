import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final Item item;
  const CartItem(this.item, {super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void deleteItemsFromCart() {
    // Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.item.imagePath),
        title: Text(widget.item.name),
        subtitle: Text(widget.item.rating),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => deleteItemsFromCart(),
        ),
      ),
    );
  }
}
