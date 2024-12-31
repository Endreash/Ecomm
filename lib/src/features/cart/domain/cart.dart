import 'package:ecomm/src/constants/test_items.dart';
import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

const _uuid= Uuid();

class Cart {
  const Cart({
    required this.itemName,
    required this.id,
  });

  final String id;
  final String itemName;

  @override
  String toString() {
    return 'Cart(description: $itemName, completed: $id)';
  }
}
class CartList extends Notifier<List<Cart>>{
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
  @override
  List<Cart> build() => [
        const Cart(id: 'item-0', itemName: 'Airpods')
  ];

  void add(String itemName) {
    state = [
      ...state,
      Cart(itemName: itemName, id: _uuid.v4())
    ];
  }

  void remove(Cart target) {
    state = state.where((cart) => cart.id != target.id).toList();
  }

  var items = itemShop;

  // list of items in the user cart
  List<Item> userCart = [];

  //get list of itemsfor sale
  List<Item> getItemList() {
    return userCart;
  }

  // get cart
  List<Item> getUserCart() {
    return userCart;
  }

  // add item to cart
  void addItemToCart(Item item) {
    userCart.add(item);
    // notifyListeners();
  }

  void removeItemFromCart(Item item) {
    userCart.remove(item);
    // notifyListeners();
  }
}
