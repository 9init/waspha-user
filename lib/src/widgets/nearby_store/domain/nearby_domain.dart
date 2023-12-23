import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/nearby_stores/data/get_favorite_stores_request_model.dart';
import 'package:waspha/src/features/nearby_stores/domain/get_favorite_stores_request_entity.dart';
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
Future<dynamic> getFavStores(Ref ref,
    {required GetFavoriteStoresRequestEntity
        getFavoriteStoresRequestEntity}) async {
  final url = "/fav-stores";
  final payload = GetFavoriteStoresRequestModel(
    lat: getFavoriteStoresRequestEntity.lat,
    lng: getFavoriteStoresRequestEntity.lng,
    radius: getFavoriteStoresRequestEntity.radius,
  ).toJson();
  debugPrint('The Payload Sent Is $payload');

  final result = await Networking.post(
    url,
    payload['location'],
  );
  debugPrint('The payLoad Was Sent To Get Fav Stores Is $payload');
  return result is Success ? (result as Success).value.data["data"] : [];
}
