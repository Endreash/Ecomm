// class CartServices {
//   final Ref ref;
//   CartServices(this.ref);

//   /// fetch the cart from the local or remote repository
//   /// depending on the user auth state
//   Future _fetchCart() {
//     return ref.read(cartRepositoryProvider).fetchCartList();
//   }
// }

// final cartServiceProvider = Provider<CartServices>((ref) {
//   return CartServices(ref);
// });

// final cartProvider = StreamProvider((ref) {
//   return ref.watch(cartRepositoryProvider).watchCartList();
// });

// final cartTotalProvider = Provider.autoDispose<double>((ref) {
//   final cart = ref.watch(cartProvider).value;
//   final productsList = ref.watch(itemsListStreamProvider).value ?? [];
//   // if (cart.isNotEmpty && productsList.isNotEmpty) {
//     var total = 0.0;
//     for (final item in cart) {
//       final product =
//           productsList.firstWhere((product) => product.id == item.key);
//       total += product.price * item.value;
//     }
//     return total;
//   // } else {
//   //   return 0.0;
//   // }
// });

import 'dart:math';

import 'package:ecomm/src/features/cart/data/cart_repository.dart';
import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartService {
  final CartRepository _cartRepository;

  CartService(this._cartRepository);

  // Add an item to the cart
  void addItemToCart(Item item) {
    _cartRepository.addItem(item);
  }

  // Remove an item from the cart
  void removeItemFromCart(Item item) {
    _cartRepository.removeItem(item);
  }

  // Get the total cost of items in the cart
  double calculateTotalCost() {
    return _cartRepository.getTotalCost();
  }

  // Get the number of items in the cart
  int getCartItemCount() {
    return _cartRepository.getCartItemsCount();
  }

  // Get all items in the cart
  List<Item> getCartItems() {
    return _cartRepository.getCartItems();
  }
}

final cartServiceProvider = Provider<CartService>((ref) {
  return CartService(ref.read(cartRepositoryProvider));
});

final cartProvider = StreamProvider<Item>((ref) {
  return ref.watch(cartRepositoryProvider).watchCartList();
});

final itemAvailableQuantityProvider = Provider.autoDispose.family<int, Item>((ref, item) {
  final cart = ref.watch(cartProvider).value;
  if (cart != null) {
    // get the current quantity for the given item in the cart
    // final quantity = cart.item[item.id] ?? 0;
    final quantity = cart.quantity ?? 0;
    // subtract it from the item available quantity
    return max(0, item.availableQuantity - quantity);
  } else {
    return item.availableQuantity;
  }
});