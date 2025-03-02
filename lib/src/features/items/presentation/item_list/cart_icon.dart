import 'package:ecomm/src/features/cart/domain/cart.dart';
import 'package:ecomm/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItemsCount = ref.watch(cartItemsCountProvider);
    // const cartItemsCount = 0;
    return Stack(
      children: [
        Center(
          child: IconButton(
            iconSize: 19, 
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () => context.pushNamed(AppRoute.cart.name),
          ),
        ),
        if (cartItemsCount > 0)
          Positioned(
            top: 4,
            right: 4,
            child: CartIconBadge(cartItemsCount),
          ),
      ],
    );
  }
}

class CartIconBadge extends StatelessWidget {
  const CartIconBadge(this.itemsCount, {super.key});
  final int itemsCount;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
        child: Text(
          '$itemsCount',
          textAlign: TextAlign.center,
          // * Force textScaleFactor to 1.0 irrespective of the device's
          // * textScaleFactor. This is to prevent the text from growing bigger
          // * than the available space.
          textScaleFactor: 1.0,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}