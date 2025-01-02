import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:riverpod/riverpod.dart';
// import 'package:uuid/uuid.dart';

  // list of shoes for sale
  // List<Item> itemShop = [
  //   Item(
  //       name: 'Airpods',
  //       price: '132.0',
  //       rating: '4.9',
  //       imagePath: 'assets/airpod.png'
  //       ),
  //   Item(
  //       name: 'Macbook Air 13',
  //       price: '1100.00',
  //       rating: '5.0',
  //       imagePath: 'assets/macbook-pro.png'),
  //   Item(
  //       name: 'iPhone 13 pro max',
  //       price: '599.0',
  //       rating: '4.7',
  //       imagePath: 'assets/iPhone13.png'),
  //   Item(
  //       name: 'iPhone 13 pro max',
  //       price: '599.0',
  //       rating: '4.7',
  //       imagePath: 'assets/iPhone13.png'),
  // ];
  // @override
  // List<Cart> build() => [
  //       const Cart(id: 'item-0', itemName: 'Airpods')
  // ];
  // var items = itemShop;
  // // list of items in the user cart
  // List<Item> userCart = [];
  // //get list of itemsfor sale
  // List<Item> getItemList() {
  //   return userCart;
  // }
  // // get cart
  // List<Item> getUserCart() {
  //   return userCart;
  // }
  // // add item to cart
  // void addItemToCart(Item item) {
  //   userCart.add(item);
  //   // notifyListeners();
  // }
  // void removeItemFromCart(Item item) {
  //   userCart.remove(item);
  //   // notifyListeners();
  // }

class CartNotifier extends StateNotifier<List<Item>>{

  CartNotifier() : super([
      // Item(
      // id: '1',
      // name: 'Airpods',
      // price: '132.0',
      // rating: '4.9',
      // imagePath: 'assets/airpod.png',
      // availableQuantity: 5,
      // description:
      //     'The Microsoft Xbox series X gaming console is capable of impressing with minimal boot times and mesmerising visual effects when playing games at up to 120 frames per second.'),
      ]);

  // Update the CartNotifier to correctly add items to the cart
  void add(Item item) {
    state = [
      ...state,
      item
      // Item(item)
      ];
  } // embi yalegn Item item pass saleregew new

  void remove(Item itemId) {
    state = state.where((item) => item.id != itemId.id).toList();
  }
  
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Item>>((ref){
  return CartNotifier();
});

final cartItemsCountProvider = Provider<int>((ref) {
  return ref.watch(cartProvider).length;
});