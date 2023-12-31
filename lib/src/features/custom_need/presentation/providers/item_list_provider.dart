
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/custom_need/data/item_data.dart';

class ListItems extends Notifier<List<Item>> {
  @override
  List<Item> build() {
    return [];
  }

  void addNewItem({required Item item}) {
    state = [...state, item];
  }

  void removeItem({required Item item}) {
    state.remove(item);
    state = [...state];
  }
}

final itemListProvider = NotifierProvider<ListItems, List<Item>>(ListItems.new);
