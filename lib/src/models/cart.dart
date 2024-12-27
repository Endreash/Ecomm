import 'package:ecomm/src/constants/test_items.dart';
import 'package:ecomm/src/models/item_model.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier{
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

  var items = itemShop;

  // list of items in the user cart
  List<Item> userCart = [];

  //get list of itemsfor sale
  List<Item> getItemList() {
    return itemShop;
  }

  // get cart
  List<Item> getUserCart() {
    return userCart;
  }

  // add item to cart
  void addItemToCart(Item item) {
    userCart.add(item);
    notifyListeners();
  }

  void removeItemFromCart(Item item) {
    userCart.remove(item);
    notifyListeners();
  }
}
