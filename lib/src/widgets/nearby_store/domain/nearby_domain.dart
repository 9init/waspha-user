import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nearby_domain.g.dart';

@riverpod
Future<bool> addStoreFav(Ref ref, {required int id}) async {
  final url = "/add-store-to-fav";
  final result = await Networking.post(url, {"store_id": id});
  return result is Success;
}

@riverpod
Future<bool> deleteStoreFav(Ref ref, {required int id}) async {
  final url = "/fav-stores/$id";
  final result = await Networking.delete(url);
  return result is Success;
}

@riverpod
Future<dynamic> getFavStores(Ref ref) async {
  final url = "/fav-stores";
  final result = await Networking.get(url);
  return result is Success ? (result as Success).value.data["data"] : [];
}

@riverpod
Future<bool> isStoreFavored(Ref ref, {required int id}) async {
  final favList = await ref.read(getFavStoresProvider.future);
  if (favList.any((element) => element["id"] == id)) {
    return true;
  }
  return false;
}
