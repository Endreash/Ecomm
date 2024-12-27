import 'package:flutter/material.dart';

enum ShirtSize { all, smartphones, headphones, laptops, extraLarge }

const List<(ShirtSize, String)> shirtSizeOptions = <(ShirtSize, String)>[
  (ShirtSize.all, 'All'),
  (ShirtSize.smartphones, 'Smartphones'),
  (ShirtSize.headphones, 'Headphones'),
  (ShirtSize.laptops, 'Laptops'),
  (ShirtSize.extraLarge, 'extraLarge'),
];

// const List<String> shirtSize = [
//   'extraSmall', 'small', 'medium', 'large', 'extralarge'
// ];
class SlideWidget extends StatefulWidget {
  // final String categoryName;
  const SlideWidget(
      // this.categoryName,
      {super.key});

  @override
  State<SlideWidget> createState() => _SlideWidgetState();
}

class _SlideWidgetState extends State<SlideWidget> {
  final List<bool> _toggleButtonsSelection =
      ShirtSize.values.map((ShirtSize e) => e == ShirtSize.all).toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ToggleButtons(
          renderBorder: false,
          borderRadius: BorderRadius.circular(20),
          borderWidth: 99,
          fillColor: Colors.green, //backgroung color
          color: Colors.black, // text color

          borderColor: Colors.black,
          selectedColor: Colors.white, // selected text color
          // selectedBorderColor: Colors.green,

          // ToggleButtons uses a List<bool> to track its selection state.
          isSelected: _toggleButtonsSelection,
          // This callback return the index of the child that was pressed.
          onPressed: (int index) {
            setState(() {
              _toggleButtonsSelection[index] = !_toggleButtonsSelection[index];
            });
          },

          // Constraints are used to determine the size of each child widget.
          constraints: const BoxConstraints(
            minHeight: 32.0,
            minWidth: 88,
          ),

          // ToggleButtons uses a List<Widget> to build its children.
          children: shirtSizeOptions.map(
                ((ShirtSize, String) shirt) => Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      shirt.$2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15.0),
                    ),
                  ),
                ),
              )
              .toList(),
        ));
  }
}

// ClipRRect(
//   child: Container(
//     width: 270,
//     height: 24,
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.green, width: 2),
//       // shape: BoxShape.circle,
//       borderRadius: BorderRadius.circular(8),
//       // color: Colors.grey[400]
//     ),
//     child: Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: FittedBox(
//         fit: BoxFit.fitWidth,
//         child: Text(
//           categoryName,
//           style: const TextStyle(fontWeight: FontWeight.w500),
//         ),
//       ),
//     ),
//   ),
// ),
