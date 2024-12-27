import 'package:ecomm/src/models/item_model.dart';
import 'package:ecomm/src/features/item_page/item_page.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  // final String itemName;
  // final String itemPrice;
  // final String itemRating;
  // final String itemImage;
  // const ItemCard(this.itemName, this.itemPrice, this.itemRating, this.itemImage, {super.key});
  const ItemCard(this.item, this.onPressed, {super.key});
  final Item item;
  final Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      // () { Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => ItemPage(item: item,)));
      // },
          
      child: Center(
        child: Container(
            width: 180,
            height: 265,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        item.imagePath,
                        height: 150,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.name,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              fontSize: 12, 
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600
                              )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            item.rating,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          )
                        ],
                      )
                    ],
                  ),
                  Text(
                    '\$${item.price}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
