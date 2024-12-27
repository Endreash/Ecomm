import 'package:flutter/material.dart';

class ToogleButtons extends StatefulWidget {
  const ToogleButtons({super.key});

  @override
  State<ToogleButtons> createState() => _ToogleButtonsState();
}

class _ToogleButtonsState extends State<ToogleButtons> {
  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [false, false, false];
    List<String> spaceSize = ['1TB', '825GB', '512GB'];
    
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ToggleButtons(
          renderBorder: false,
          fillColor: Colors.green, //backgroung color
          color: Colors.black, // text color
          selectedColor: Colors.white,
          onPressed: (int index) {
            setState(() {
              // isSelected[index] = !isSelected[index];
              for (int index = 0; index < isSelected.length; index++) {
                if (index == index) {
                  isSelected[index] = true;
                } else {
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
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(size,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18.0)),
                    ),
                  ))
              .toList()),
    );
  }
}
