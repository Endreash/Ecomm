
import 'package:ecomm/src/features/cart/services/cart_services.dart';
import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartController extends StateNotifier<AsyncValue<int>>{
  CartController({required this.cartService}) : super(const AsyncData(1));
  final CartService cartService;
  void updateQuantity(int quantity) {
    state = AsyncData(quantity);
  }
  
  void increaseQuantity(Item item) {
    item.quantity = item.quantity + 1;
  }

  void decreaseQuantity(Item item) {
    item.quantity = item.quantity - 1;
    if (item.quantity < 1) {
      // checkoutProducts.remove(product);
    } 
  }
}

final cartControllerProvider = StateNotifierProvider.autoDispose<CartController, AsyncValue<int>>(
        (ref) {
  return CartController(
    cartService: ref.watch(cartServiceProvider),
  );
});