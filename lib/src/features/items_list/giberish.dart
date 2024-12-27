import 'package:ecomm/src/features/items_list/discount_sale_container.dart';
import 'package:ecomm/src/util/category_slide.dart';
import 'package:ecomm/src/widgets/responsive_center.dart';
import 'package:flutter/material.dart';

class Giberish extends StatelessWidget {
  const Giberish({super.key});

  @override
  Widget build(BuildContext context) {
    final List categories = [
      'All',
    ];
    return Scaffold(
      body: Column(
        children: [
          const ResponsiveCenter(child: DiscountSaleContainer()),
            const SizedBox(
              height: 8.0,
            ),
            SizedBox(
              height: 32,
              child: SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return const SlideWidget();
                      })),
            ),
            const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}