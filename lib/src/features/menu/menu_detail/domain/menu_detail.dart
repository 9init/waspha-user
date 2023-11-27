import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

import '../../../nearby_stores/domain/stores_repository.dart';

part 'menu_detail.g.dart';

Future<dynamic> fetchStoreDetailInfo(int id, WidgetRef ref) async {
  final String url = "/store-detail-info";
  final location = await ref.read(userLocationProvider.future);

  final result = await Networking.post(url, {
    "store_id": id,
    "location": {
      "address": "abc xyz",
      "lat": location!.latitude,
      "lng": location.longitude,
    }
  });

  return switch (result) {
    Success(value: final value) => value.data["data"],
    Failure() => throw Exception("Failed to fetch store detail info"),
    Error() => throw Exception("Error while fetching store detail info")
  };
}

@riverpod
Future<dynamic> getStoresDetails(Ref ref, {required int id}) async {
  final String url = "/store-detail-info";
  final location = await ref.watch(userLocationProvider.future);

  final result = await Networking.post(url, {
    "store_id": id,
    "location": {
      "address": "abc xyz",
      "lat": location!.latitude,
      "lng": location.longitude,
    },
  });

  return switch (result) {
    Success(value: final value) => value.data["data"],
    Failure() => throw Exception("Failed to get store details"),
    Error() => throw Exception("Error while getting store details"),
  };
}

@riverpod
Future<dynamic> getStoreReviews(Ref ref, {required int id}) async {
  final String url = "/store-reviews-ratings";
  final result = await Networking.post(url, {"store_id": id});

  final response = switch (result) {
    Success(value: final value) => value.data["data"],
    Failure() => null,
    Error() => null
  };

  if (response != null) {
    return response;
  }
}
