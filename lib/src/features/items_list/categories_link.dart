import 'package:flutter/material.dart';

class CategoriesLink extends StatelessWidget {
  const CategoriesLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'See all',
                style: TextStyle(color: Colors.green),
              ))
        ],
      ),
    );
  }
}
