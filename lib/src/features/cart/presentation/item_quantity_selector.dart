// import 'package:ecomm/src/features/items/domain/item_model.dart';
// import 'package:flutter/material.dart';

// class ItemQuantitySelector extends StatefulWidget {
//   final Item item;
//   final int quantity;

//   const ItemQuantitySelector(this.item, {required this.quantity, super.key});

//   @override
//   State<ItemQuantitySelector> createState() => _ItemQuantitySelectorState();
// }

// class _ItemQuantitySelectorState extends State<ItemQuantitySelector> {

//   int _quantity = 1;
//   // int _quantity = quantity;

//   void setQuantity(bool isIncrement) {
//     if (isIncrement) {
//       // _quantity = _quantity + 1;
//       _quantity = checkQuantity(_quantity + 1);
//     } else {
//       _quantity = checkQuantity(_quantity - 1);
//     }
//     setState(() {});
//   }

//   int checkQuantity(int quantity){
//     if(quantity<0){
//       return 0;
//     } else if (quantity>10){ // TODO; add a snackbar when it exceeds
//       return 10; // it should come from server
//     } else {
//       return quantity;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // GestureDetector(
//         //   onTap: () {
//         //     setQuantity(false);
//         //     print(_quantity);
//         //   },
//         //   child: const Icon(
//         //     Icons.remove,
//         //     color: Colors.green,
//         //     size: 20.0,
//         //   ),
//         // ),
//         IconButton(
//               icon: const Icon(Icons.remove, color: Colors.green), // Icon
//               onPressed: () => {
//                 setQuantity(false)
//               },
//               hoverColor: Colors.transparent,
//               splashColor: Colors.transparent, 
//               highlightColor: Colors.transparent, 
//             ),
//         const SizedBox(
//           width: 4,
//         ),
//         Text(
//           _quantity.toString(),
//         ),
//         const SizedBox(
//           width: 4,
//         ),
//         IconButton(
//               icon: const Icon(Icons.add, color: Colors.green), // Icon
//               onPressed: () => {
//                 setQuantity(true)
//               },
//               hoverColor: Colors.transparent,
//               splashColor: Colors.transparent, 
//               highlightColor: Colors.transparent, 
//             ),
//         // const SizedBox(width: 64),
//         // Text(
//         //   "${setTotal().toString()} ETB",
//         // )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

/// Item quantity selector with +/- buttons and a text value in the middle
class ItemQuantitySelector extends StatelessWidget {
  const ItemQuantitySelector({
    super.key,
    required this.quantity,
    this.maxQuantity = 10,
    this.itemIndex,
    this.onChanged,
  });
  final int quantity;
  final int maxQuantity;
  final int? itemIndex;
  final ValueChanged<int>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: onChanged != null && quantity > 1
                ? () => onChanged!.call(quantity - 1)
                : null,
          ),
          SizedBox(
            width: 30.0,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onChanged != null && quantity < maxQuantity
                ? () => onChanged!.call(quantity + 1)
                : null,
          ),
        ],
      ),
    );
  }
}
