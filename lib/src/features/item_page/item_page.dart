// import 'package:ecomm/src/models/cart.dart';
import 'package:ecomm/src/models/item_model.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  final Item item;
  const ItemPage(this.item, {super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  List<bool> isSelected = [false, false, false];

  List<String> spaceSize = ['1TB', '825GB', '512GB'];

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
    // Consumer(
    //     builder: (context, value, child) => 
        Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  MaterialButton(
                    onPressed: () {},
                    child: const Icon(Icons.favorite_border),
                  ),
                ],
              ),
              body: Column(
                children: [
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        image: const DecorationImage(
                            image: AssetImage('assets/xbox.png'),
                            fit: BoxFit.cover)),
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.item.name,
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 32,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.red[400]),
                                child: const Center(
                                  child: Text(
                                    '% On sale',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      // color: Colors.grey,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 186, 185, 185)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50))),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 18,
                                      ),
                                      Text(
                                        '4.9',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )
                                    ],
                                  )),
                              const SizedBox(width: 8),
                              Container(
                                  padding: const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      // color: Colors.grey,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 186, 185, 185)),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50))),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.thumb_up,
                                        color: Colors.green,
                                        size: 18,
                                      ),
                                      Text(
                                        ' 94%',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      )
                                    ],
                                  )),
                              const SizedBox(width: 8),
                              const Text(
                                '117 reviews',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'The Microsoft Xbox series X gaming console is capable of impressing with minimal boot times and mesmerising visual effects when playing games at up to 120 frames per second.',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ToggleButtons(
                                renderBorder: false,
                                fillColor: Colors.green, //backgroung color
                                color: Colors.black, // text color
                                selectedColor: Colors.white,
                                onPressed: (int index) {
                                  setState(() {
                                    // isSelected[index] = !isSelected[index];
                                    for (int index = 0;
                                        index < isSelected.length;
                                        index++) {
                                      if (index == index) {
                                        isSelected[index] = true;
                                      } else{
                                        isSelected[index] = false;
                                      }
                                    }
                                  });
                                },
                                constraints: const BoxConstraints(
                                  minHeight: 34,
                                  minWidth: 88,
                                ),
                                isSelected: isSelected,
                                children: spaceSize
                                    .map((size) => Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12),
                                            child: Text(size,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18.0)),
                                          ),
                                        ))
                                    .toList()),
                          ),
                          const SizedBox(height: 4),
                          Divider(thickness: 2, color: Colors.grey[300]),
                          const SizedBox(height: 8),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  children: [
                                    Text('\$650',
                                        style: TextStyle(
                                            // color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough)),
                                    Text(
                                      '\$570.00',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                // const SizedBox(width: 30),
                                GestureDetector(
                                  onTap: () => addItemToCart(),
                                  child: Container(
                                    height: 64,
                                    width: 220,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: Colors.green),
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
                                )
                              ])
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            );
  }
}
