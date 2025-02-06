import 'package:ecomm/src/constants/test_items.dart';
import 'package:ecomm/src/features/items/domain/item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemsRepository {
  final List<Item> _items = itemShop;

  List<Item> getItemsList(){
    return _items;
  }

  Item? getItem(String id){
    return _items.firstWhere((item) => item.id == id);
  }

  Future<List<Item>> fetchItemsList(){
    return Future.value(_items);
  }

  Stream<List<Item>> watchItemsList(){
    return Stream.value(_items);
  }

  Stream<Item> watchItem(String id){
    return watchItemsList().map((items) => items.firstWhere((item) => item.id == id));
  }
}

// decleared this provider is a global variable
// Provider<>... needs type annotation, what type of objects are they
final itemsRepositoryProvider = Provider<ItemsRepository>((ref) {
  return ItemsRepository(); // returns an instance of ItemsRepository
});

final itemsListStreamProvider = StreamProvider.autoDispose<List<Item>>((ref){
  final itemsRepository = ref.watch(itemsRepositoryProvider);
  return itemsRepository.watchItemsList();
});