import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/nearby_stores/data/stores_data.dart';
import 'package:waspha/src/utils/dio_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nearby_domain.g.dart';

@riverpod
Future<bool> addStoreFav(Ref ref, {required int id}) async {
  final url = "user/add-store-to-fav";
  try {
    final request = await ref.watch(dioProvider).post(url, {"store_id": id});
    if (request.statusCode == 200) {
      return true;
    }
  } catch (e) {}
  return false;
}

@riverpod
Future<bool> deleteStoreFav(Ref ref, {required int id}) async {
  final url = "user/fav-location/$id";
  try {
    final request = await ref.watch(dioProvider).delete(url);
    if (request.statusCode == 200) {
      return true;
    }
  } catch (e) {}
  return false;
}

@riverpod
Future getFavStores(Ref ref) async {
  final url = "user/fav-stores";
  try {
    final request = await ref.watch(dioProvider).get(url);
    if (request.statusCode == 200) {
      return request.data["data"];
    }
  } catch (e) {}
  return [];
}

@riverpod
Future<bool> isStoreFavorited(Ref ref, {required int id}) async {
  final favList = await ref.read(getFavStoresProvider.future);
  if (favList.any((element) => element["id"] == id)) {
    return true;
  }
  return false;
}
