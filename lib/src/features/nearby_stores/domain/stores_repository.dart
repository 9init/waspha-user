import 'dart:convert';

import 'package:bitmap/bitmap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:waspha/src/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:waspha/src/features/nearby_stores/data/stores_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../get_location/domain/get_location_domain.dart';
import '../presentation/rounded_marker.dart';

part 'stores_repository.g.dart';

var client = http.Client();

final methodProvider = StateProvider<String>((ref) {
  return "delivery";
});

@riverpod
Stream getNearbyStoresStream(
  Ref ref, {
  required BuildContext context,
  required ValueNotifier<bool> isBottomSheetOpen,
}) async* {
  while (true) {
    await Future.delayed(Duration(seconds: 5));
    yield await getNearbyStores(ref,
        context: context, isBottomSheetOpen: isBottomSheetOpen);
  }
}

Future<LocationData> getLocation() async {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return LocationData.fromMap({
        "latitude": 0.0,
        "longitude": 0.0,
      });
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return LocationData.fromMap({
        "latitude": 0.0,
        "longitude": 0.0,
      });
    }
  }

  _locationData = await location.getLocation();
  return _locationData;
}

@riverpod
Future<Map<String, dynamic>> getNearbyStores(Ref ref,
    {required BuildContext context,
    required ValueNotifier<bool> isBottomSheetOpen}) async {
  final url = "$restAPI/user/get-nearby-stores";

  final location = await getLocation();

  final userLocation = ref.watch(getUserLocation);
  print(userLocation);

  double latitude = location.latitude ?? 0.0;

  double longitude = location.longitude ?? 0.0;

  var request = await client.post(Uri.parse(url),
      body: json.encode({
        "location": {"lat": latitude, "lng": longitude},
        "method": ref.watch(methodProvider.notifier).state
      }));

  if (request.statusCode == 200) {
    var response = json.decode(request.body);

    String message = response["message"];

    var storesList = response["data"]["stores"];

    var categoriesList = response["data"]["categories"];

    return {
      "lat": latitude,
      "lng": longitude,
      "message": message,
      "stores": storesList.map((job) => Stores.fromJson(job)).toList(),
      "categories":
          categoriesList.map((job) => Categories.fromJson(job)).toList(),
    };
  }

  if (!isBottomSheetOpen.value) {
    isBottomSheetOpen.value = true;
    showModalBottomSheet(
        enableDrag: false,
        context: context,
        builder: (context) => Container(
              height: 200,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("No result Found"),
                    ),
                    Text("Stores with Pickup service not found"),
                    SizedBox(height: 20),
                    Text("Search another area or order delivery instead"),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          onPressed: () async {
                            await ref
                                .refresh(getNearbyStoresProvider(
                                    context: context,
                                    isBottomSheetOpen: isBottomSheetOpen))
                                .value;
                          },
                          child: Text("Refresh")),
                    )
                  ],
                ),
              ),
            ));
  }

  return {
    "lat": latitude,
    "lng": longitude,
    "message": "Stores not found",
    "stores": [],
    "categories": []
  };
}

@riverpod
Future<BitmapDescriptor> imageBytes(Ref ref, {required imageURL}) async {
  Bitmap bitmap = await Bitmap.fromProvider(NetworkImage(imageURL));
  Bitmap resizedBitmap = bitmap.apply(BitmapResize.to(width: 100, height: 100));
  Uint8List imageBytes = resizedBitmap.buildHeaded();
  return await convertImageFileToCustomBitmapDescriptor(
    imageBytes,
    size: 100,
    addBorder: true,
    borderColor: Colors.black,
    borderSize: 3,
  );
}
