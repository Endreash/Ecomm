// import 'package:ecomm/src/features/cart/domain/cart.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class CartRepository {
//   // final List<Cart> cart = [];
//   final cart = CartNotifier();

//   //  List<Cart> getCartList(){
//   //   return cart;
//   // }
//    getCartList(){
//     return cart;
//   }

//   // Cart? getCart(String id){
//   //   return cart.firstWhere((item) => item.id == id);
//   // }

//   Future fetchCartList(){
//     return Future.value(cart);
//   }

//   Stream watchCartList(){
//     return Stream.value(cart);
//   }

//   Stream watchCart(String id){
//     return watchCartList().map((items) => items.firstWhere((item) => item.id == id));
//   }
// }

// final cartRepositoryProvider = Provider<CartRepository>((ref) {
//   return CartRepository(); // returns an instance of CartRepository
// });

import 'package:ecomm/src/features/cart/domain/cart.dart';
import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartRepository {
  final Ref _ref;

  CartRepository(this._ref);

  // Add an item to the cart
  void addItem(Item item) {
    _ref.read(cartProvider.notifier).add(item);
  }

  // Remove an item from the cart
  void removeItem(Item item) {
    _ref.read(cartProvider.notifier).remove(item);
  }

  // Get the total cost of items in the cart
  double getTotalCost() {
    final cartItems = _ref.read(cartProvider);
    double sum = 0.0;
    for (var item in cartItems) {
      sum += item.price * item.quantity;
    }
    return sum;
  }

  // Get the number of items in the cart
  int getCartItemsCount() {
    return _ref.read(cartItemsCountProvider);
  }

  // Get all items in the cart
  List<Item> getCartItems() {
    return _ref.read(cartProvider);
  }

  // Watch the entire cart list as a stream
  Stream<Item> watchCartList() {
    return _ref.read(cartProvider.notifier).cartStream;
  }

  // Watch a specific item in the cart by its ID as a stream
  // Stream<Item> watchCart(String itemId) {
  //   return _ref.read(cartProvider.notifier).cartStream.map((cartItems) {
  //     return cartItems.firstWhere((item) => item.id == itemId);
  //   });
  // }
}

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepository(ref);
});