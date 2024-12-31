// import 'package:ecomm/src/features/cart/presentation/item_quantity_selector.dart';
import 'package:ecomm/src/features/cart/domain/cart.dart';
import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartCard extends ConsumerWidget {
  CartCard(this.item, {super.key});
  final Item item;

  int _quantity = 1;

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      // _quantity = checkQuantity(_quantity + 1);
      _quantity = _quantity + 1;
    } else {
      _quantity = _quantity - 1;
    }
    // setState(() {});
  }

  double setTotal() {
      // double price = item.price;
      double price = 300;
      // print(price);
      double total;
      return total = price * _quantity;
  }
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // const size = 150.0;
    // final padding = (MediaQuery.of(context).size.width - size) / 2;

    // final sizee = MediaQuery.sizeOf(context);

    // print(sizee);
    // print(padding);
    // final screenWidth = MediaQuery.of(context).size.width;
    // double baseWidth = 408;
    // double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    // print(screenWidth);
    // print(fem);

    final cart = ref.watch(cartProvider);

    return Container(
      // height: 100,
      // width: screenWidth,
      // width: 368*fem,

      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8,),
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
                      Text(item.name,
                      style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.close))
                      ],
                  ),
                  const Text("1TB",
                    style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey),),
                  const SizedBox(height: 8,),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '\$650.00',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 32,),
                      // ItemQuantitySelector(quantity: 5)
                      Row(
                        children: [
                        GestureDetector(
                          onTap: () {
                            // setQuantity(false);
                            print(_quantity);
                          },
                          child: const Icon(
                            Icons.remove,
                            color: Colors.blueAccent,
                            size: 36.0,
                          ),
                        ),
                        const SizedBox(width: 12,),
                        Text(_quantity.toString(),),
                        // Text('aa'),
                        const SizedBox(width: 12,),
                        GestureDetector(
                          onTap: () {
                            // setQuantity(true);
                            print(_quantity);
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.blueAccent,
                            size: 36.0,
                          )),
                        // const SizedBox(width: 64),
                        // Text(
                        //   "${setTotal().toString()} ETB",
                        // )
                        ],
                      ),
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