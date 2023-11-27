import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/likes/data/likes_data.dart';
import 'package:waspha/src/features/likes/presentation/choose_location.dart';
import 'package:waspha/src/features/nearby_stores/domain/stores_repository.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

part 'likes_domain.g.dart';

@riverpod
Future<String> addLocation(
  Ref ref, {
  required String title,
  required String? phone,
  required String? userName,
  required String landmark,
  required String locationType,
  bool isMeChecked = false,
}) async {
  final url = '/add-location-to-fav';
  final details = ref.watch(getChosenLocationProvider);
  if (details == null) return "Please add location";

  final payload = {
    "title": title,
    "landmark": landmark,
    "location_type": locationType,
    "location": {
      "country_code":
          await getCountryCodeFromLatLng(details["lat"], details["lng"]),
      "address": details["address"],
      "lat": details["lat"],
      "lng": details["lng"],
    }
  };
  if (phone != null) {
    payload["phone"] = phone;
  }
  if (userName != null) {
    payload["phone_username"] = userName;
  }

  final result = await Networking.post(url, payload);

  return switch (result) {
    Success(value: final value) => value.data["message"],
    Failure() => "",
    Error() => "",
  };
}

@riverpod
Future<List<DataLocation>> getLocations(Ref ref) async {
  final url = '/fav-locations';

  final result = await Networking.get(url);

  return switch (result) {
    Success(value: final value) => value.data["data"]
        .map<DataLocation>((e) => DataLocation.fromJson(e))
        .toList(),
    Failure() => [],
    Error() => [],
  };
}

@riverpod
Future<String> addLocationFav(Ref ref,
    {required LatLng location, required String address}) async {
  final url = '/add-location-to-fav';
  final countryCode = await ref.watch(getCountryCodeProvider.future);

  final result = await Networking.post(url, {
    "location": {
      "lat": location.latitude,
      "lng": location.longitude,
      "country_code": countryCode,
    },
    "location_string": address,
    "location_type": "HOME",
  });

  return switch (result) {
    Success() => "Location added successfully",
    Failure() => "Error happened",
    Error() => "Error happened",
  };
}

@riverpod
Future<String> deleteLocation(Ref ref, {required int id}) async {
  final url = '/fav-locations/$id';

  final result = await Networking.delete(url);

  return switch (result) {
    Success() => "Location deleted successfully",
    Failure() => "Error happened",
    Error() => "Error happened",
  };
}
