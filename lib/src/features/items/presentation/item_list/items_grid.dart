import 'dart:math';

import 'package:ecomm/src/features/items/presentation/item_list/item_card.dart';
import 'package:ecomm/src/routing/app_route.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:ecomm/src/constants/test_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var items = itemShop;
    return items.isEmpty
        ? Center(
            child: Text(
              'No products found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          )
        : ItemsLayoutGrid(
            itemCount: items.length,
            itemBuilder: (_, index) {
              final item = items[index];
              return ItemCard(
                item,
                () => context.goNamed(
                  AppRoute.item.name,
                  pathParameters: {'id':item.id},
                )
              );
            },
          );
  }
}

// Grid widget with content-sized items.
// https://codewithandrea.com/articles/flutter-layout-grid-content-sized-items/
class ItemsLayoutGrid extends StatelessWidget {
  const ItemsLayoutGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  // Total number of items to display.
  final int itemCount;


  // Function used to build a widget for a given index in the grid.
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    // use a LayoutBuilder to determine the crossAxisCount
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      // 1 column for width < 500px
      // then add one more column for each 250px
      final crossAxisCount = max(1, width ~/ 250);
      // once the crossAxisCount is known, calculate the column and row sizes
      // set some flexible track sizes based on the crossAxisCount with 1.fr
      final columnSizes = List.generate(crossAxisCount, (_) => 1.fr);
      final numRows = (itemCount / crossAxisCount).ceil();
      // set all the row sizes to auto (self-sizing height)
      final rowSizes = List.generate(numRows, (_) => auto);
      // Custom layout grid. See: https://pub.dev/packages/flutter_layout_grid
      return LayoutGrid(
        columnSizes: columnSizes,
        rowSizes: rowSizes,
        rowGap: 24, // equivalent to mainAxisSpacing
        columnGap: 24, // equivalent to crossAxisSpacing
        children: [
          // render all the items with automatic child placement
          for (var i = 0; i < itemCount; i++) itemBuilder(context, i),
        ],
      );
    });
  }
}
