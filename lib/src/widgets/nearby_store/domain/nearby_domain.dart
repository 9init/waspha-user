import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/nearby_stores/data/get_favorite_stores_request_model.dart';
import 'package:waspha/src/features/nearby_stores/domain/get_favorite_stores_request_entity.dart';
import 'package:waspha/src/features/nearby_stores/domain/stores_repository.dart';
import 'package:waspha/src/features/profile/domain/pickup_radius.domain.dart';
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
  final currentLocation = await ref.watch(userLocationProvider.future);
  final range = ref.read(pickupRadiusProvider).pickupRadius;
  final method = ref.read(methodProvider.notifier).state;

  final payload = GetFavoriteStoresRequestModel(
    location: Location(
      lat: currentLocation!.latitude,
      lng: currentLocation.longitude,
      country_code:
          ref.read(getCountryCodeProvider).asData?.valueOrNull ?? "EG",
    ),
    range: range,
    method: method,
  ).toJson();

  debugPrint('The Payload Sent Is $payload');

  final result = await Networking.post(
    url,
    payload,
  );
  debugPrint('The payLoad Was Sent To Get Fav Stores Is $payload');
  return result is Success ? (result as Success).value.data["data"] : [];
}
