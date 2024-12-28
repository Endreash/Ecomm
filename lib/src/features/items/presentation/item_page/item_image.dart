import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          image: const DecorationImage(
              image: AssetImage('assets/xbox.png'), 
              fit: BoxFit.cover)),
    );
  }
}
