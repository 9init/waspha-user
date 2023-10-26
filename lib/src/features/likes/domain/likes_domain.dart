import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/utils/dio_helper.dart';

import '../data/likes_data.dart';
import '../presentation/choose_location.dart';

part 'likes_domain.g.dart';

@riverpod
Future<String> addLocation(Ref ref,
    {required String title,
    required String phone,
    bool isMeChecked = false,
    required String landmark}) async {
  final url = 'user/add-location';
  final details = ref.watch(getChoosenLocationProvider);
  try {
    final request = await ref.watch(dioProvider).post(url, {
      "title": title,
      "phone": phone,
      "landmark": landmark,
      "location": {
        "address": details["address"],
        "lat": details["lat"],
        "lng": details["lng"]
      }
    });
    print(request);
    return request.data["message"];
  } on DioError catch (e) {
    print("ADD LOCATION ERROR ${e.response?.data}");
  }
  return "";
}

@riverpod
Future<List<Location>> getLocations(Ref ref) async {
  final url = 'user/locations';
  try {
    final request = await ref.watch(dioProvider).post(url, {});
    final data = request.data["data"];
    final locations = data.map<Location>((e) => Location.fromJson(e)).toList();
    return locations;
  } on DioError catch (e) {
    print("GET LOCATIONS ERROR ${e.response?.data}");
  }
  return [];
}
