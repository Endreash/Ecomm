// import 'package:ecomm/src/features/cart/presentation/item_quantity_selector.dart';
import 'package:ecomm/src/features/cart/domain/cart.dart';
import 'package:ecomm/src/features/cart/presentation/item_quantity_selector.dart';
import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartCard extends ConsumerWidget {
  const CartCard(this.item, {super.key});
  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final cart = ref.watch(cartProvider);
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12)),
              child: Container(
                alignment: Alignment.center,
                child: Image.asset(
                  item.imagePath,
                  height: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                          onPressed: () {
                            ref.read(cartProvider.notifier).remove(item);
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  const Text(
                    "1TB",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '\$650.00',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      ItemQuantitySelector(item)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(child: Divider(thickness: 2, color: Colors.grey[900])),
          ],
        ),
      ),
    );
  }
}
