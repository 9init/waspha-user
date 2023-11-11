import 'dart:convert';
import 'dart:ui' as ui;

import 'package:bitmap/bitmap.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:waspha/src/features/nearby_stores/data/stores_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/utils/dio_helper.dart';

import '../../../routes/routes.dart';
import '../../get_location/domain/get_location_domain.dart';
import '../presentation/rounded_marker.dart';
part 'stores_repository.g.dart';

final methodProvider = StateProvider<String>((ref) {
  return "delivery";
});

class NearbyData {
  BuildContext context;
  ValueNotifier<bool> isBottomSheetOpen;
  ValueNotifier<LatLng> userLocation;

  NearbyData({
    required this.context,
    required this.isBottomSheetOpen,
    required this.userLocation,
  });
}

@riverpod
Stream<dynamic> getNearbyStoresStream(
  Ref ref, {
  required BuildContext context,
  required ValueNotifier<bool> isBottomSheetOpen,
  required ValueNotifier<LatLng> userLocation,
}) async* {
  while (true) {
    await Future.delayed(Duration(seconds: 5));

    yield await getNearbyStores(ref,
        context: context,
        isBottomSheetOpen: isBottomSheetOpen,
        userLocation: userLocation);
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
Future<dynamic> getNearbyStores(
  Ref ref, {
  required BuildContext context,
  required ValueNotifier<bool> isBottomSheetOpen,
  required ValueNotifier<LatLng> userLocation,
}) async {
  final url = "user/get-nearby-stores";
  // final location = await getLocation();
  // double latitude = location.latitude ?? 0.0;
  // print("LAT: GPS: $latitude");

  // double longitude = location.longitude ?? 0.0;

  // final userL = ref.watch(getUserLocation);

  LatLng location = await ref.watch(userLocationProvider.future);

  try {
    var request = await ref.watch(dioProvider).post(
        url,
        jsonEncode({
          "location": {
            "lat": location.latitude,
            "lng": location.longitude,
            "country_code":
                ref.read(getCountryCodeProvider).asData?.valueOrNull ?? "EG"
          },
          "method": ref.watch(methodProvider.notifier).state
        }));

    var response = request.data;

    String message = response["message"];

    var storesList = response["data"]["stores"];

    var categoriesList = response["data"]["categories"];
    return {
      "lat": location.latitude,
      "lng": location.longitude,
      "message": message,
      "stores": storesList.map((job) => Stores.fromJson(job)).toList(),
      "categories":
          categoriesList.map((job) => Categories.fromJson(job)).toList(),
    };
  } on DioError catch (e) {
    print("STORE ERROR:${e.response?.data}");
    if (!isBottomSheetOpen.value) {
      isBottomSheetOpen.value = true;
      final context = rootNavigatorKey.currentState?.overlay?.context;

      showModalBottomSheet(
          enableDrag: false,
          context: context!,
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
                                      isBottomSheetOpen: isBottomSheetOpen,
                                      userLocation: userLocation))
                                  .value;
                            },
                            child: Text("Refresh")),
                      )
                    ],
                  ),
                ),
              ));
    }
  }

  return {
    "lat": location.latitude,
    "lng": location.longitude,
    "message": "Stores not found",
    "stores": [],
    "categories": []
  };
}

final imageBytesProvider = FutureProvider.family<BitmapDescriptor, String>(
    (ref, String imageURL) async {
  return await imageBytes(imageURL: imageURL);
});

Future<BitmapDescriptor> imageBytes({required String imageURL}) async {
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

Future<String> getCountryCode(ref) async {
  const googelApiKey = 'AIzaSyCvpTXATfxER0gnLrqbQ1FJmSVtA2-5KXo';
  LatLng location = await ref.watch(userLocationProvider.future);

  GeoData data = await Geocoder2.getDataFromCoordinates(
    latitude: location.latitude,
    longitude: location.longitude,
    googleMapApiKey: googelApiKey,
  );
  print("COUNTRY CODE: ${data.countryCode}");
  return data.countryCode;
}

final getCountryCodeProvider = FutureProvider<String>((ref) async {
  return await getCountryCode(ref);
});

Future<Uint8List> svgToBitMap(String svg_path, BuildContext context) async {
  String svgString = await DefaultAssetBundle.of(context).loadString(svg_path);
  final PictureInfo pictureInfo =
      await vg.loadPicture(SvgStringLoader(svgString), null);

  final ui.Image image = await pictureInfo.picture.toImage(110, 110);

  ByteData bytes = (await image.toByteData(format: ui.ImageByteFormat.png))!;

  return bytes.buffer.asUint8List();
}

final userLocationProvider = FutureProvider<LatLng>((ref) async {
  final gpsLocation = await getLocation();
  print("GPS: ${gpsLocation.latitude}");
  final chosenLocation = ref.watch(getUserLocation);
  print("CHOSEN: ${chosenLocation.latitude}");
  return chosenLocation.latitude == 0.0
      ? LatLng(gpsLocation.latitude ?? 0.0, gpsLocation.longitude ?? 0.0)
      : chosenLocation;
});

Future<String> getPlaceDetails(ref, {required LatLng location}) async {
  const googelApiKey = 'AIzaSyCvpTXATfxER0gnLrqbQ1FJmSVtA2-5KXo';

  GeoData data = await Geocoder2.getDataFromCoordinates(
    latitude: location.latitude,
    longitude: location.longitude,
    googleMapApiKey: googelApiKey,
  );
  return data.address;
}
