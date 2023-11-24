import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/utils/dio_helper.dart';

import '../../nearby_stores/domain/stores_repository.dart';
import '../data/likes_data.dart';
import '../presentation/choose_location.dart';

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
  final url = 'user/add-location-to-fav';
  final details = ref.watch(getChosenLocationProvider);
  if (details == null) return "Please add location";
  try {
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
      payload["user_phone_number"] = userName;
    }
    final request = await ref.watch(dioProvider).post(url, payload);
    print(request);
    ref.invalidate(getLocationsProvider);
    return request.data["message"];
  } on DioError catch (e) {
    print("ADD LOCATION ERROR ${e.response?.data}");
  }
  return "";
}

@riverpod
Future<List<DataLocation>> getLocations(Ref ref) async {
  final url = 'user/fav-locations';
  try {
    final request = await ref.watch(dioProvider).get(url);
    final data = request.data["data"];
    return data.map<DataLocation>((e) => DataLocation.fromJson(e)).toList();
  } on DioError catch (e) {
    print("GET LOCATIONS ERROR ${e.response?.data}");
  }
  return [];
}

@riverpod
Future<String> addLocationFav(Ref ref,
    {required LatLng location, required String address}) async {
  final url = 'user/add-location-to-fav';
  final countryCode = await ref.watch(getCountryCodeProvider.future);
  try {
    await ref.watch(dioProvider).post(url, {
      "location": {
        "lat": location.latitude,
        "lng": location.longitude,
        "country_code": countryCode,
      },
      "location_string": address,
      "location_type": "HOME",
    });
    return "Location added successfully";
  } on DioError catch (e) {
    print("ADD LOCATION ERROR ${e.response?.data}");
  }
  return "Error happened";
}

@riverpod
Future<String> deleteLocation(Ref ref, {required int id}) async {
  final url = 'user/fav-locations/$id';
  try {
    await ref.watch(dioProvider).delete(url);
    return "Location deleted successfully";
  } on DioError catch (e) {
    print("DELETE LOCATION ERROR ${e.response?.data}");
  }
  return "Error happened";
}
