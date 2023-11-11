import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/utils/dio_helper.dart';

import '../../../nearby_stores/domain/stores_repository.dart';

part 'menu_detail.g.dart';

@riverpod
Future<dynamic> getStoresDetails(Ref ref, {required int id}) async {
  final String url = "user/store-detail-info";
  final location = await ref.watch(userLocationProvider.future);
  try {
    final request = await ref.watch(dioProvider).post(url, {
      "store_id": id,
      "location": {
        "address": "abc xyz",
        "lat": location.latitude,
        "lng": location.longitude
      }
    });
    return request.data["data"];
  } catch (e) {}
}

@riverpod
Future<dynamic> getStoreReviews(Ref ref, {required int id}) async {
  final String url = "user/store-reviews-ratings";
  try {
    final request = await ref.watch(dioProvider).post(url, {"store_id": id});
    return request.data["data"];
  } catch (e) {}
}
