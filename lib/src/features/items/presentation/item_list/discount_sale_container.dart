import 'package:flutter/material.dart';

class DiscountSaleContainer extends StatelessWidget {
  const DiscountSaleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: make a page where onsale are available
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.green,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Clearance',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w400),
                ),
                const Text(
                  'Sales',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 32,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white),
                  child: const Center(
                    child: Text(
                      '%  Up to 50%',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Image.asset(
              'assets/homeIphone.png',
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
