import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
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
            height: 225,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                      Flexible(
                        child: Text(item.name,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: 12, 
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade600
                                )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            size: 18,
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text(
                            item.rating,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
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
