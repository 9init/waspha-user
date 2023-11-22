import 'dart:convert';
import 'dart:ui' as ui;

import 'package:bitmap/bitmap.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:waspha/src/features/nearby_stores/data/stores_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/features/nearby_stores/domain/location.dart';
import 'package:waspha/src/utils/dio_helper.dart';
import 'package:image/image.dart' as img;

import '../../../routes/routes.dart';
import '../../get_location/domain/get_location_domain.dart';
import '../presentation/rounded_marker.dart';
part 'stores_repository.g.dart';

final methodProvider = StateProvider<String>((ref) {
  return "delivery";
});

final getStoresProvider = StateProvider<List<dynamic>>((ref) => []);

class NearbyData {
  BuildContext context;
  ValueNotifier<bool> isBottomSheetOpen;

  NearbyData({
    required this.context,
    required this.isBottomSheetOpen,
  });
}

@riverpod
Stream<dynamic> getNearbyStoresStream(
  Ref ref, {
  required BuildContext context,
  required ValueNotifier<bool> isBottomSheetOpen,
}) async* {
  while (true) {
    await Future.delayed(Duration(seconds: 5));
    yield await getNearbyStores(
      ref,
      context: context,
      isBottomSheetOpen: isBottomSheetOpen,
    );
  }
}

@riverpod
Future<dynamic> getNearbyStores(
  Ref ref, {
  required BuildContext context,
  required ValueNotifier<bool> isBottomSheetOpen,
}) async {
  final url = "user/get-nearby-stores";

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
                                  ))
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
  const googelApiKey = 'AIzaSyDkxNsmr6MY8Aa-iDZx_9P8SJsmFs_4le8';
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

Uint8List addPaddingToImage(Uint8List bitmap, int topPadding, int rightPadding,
    int bottomPadding, int leftPadding) {
  // Decode the bitmap
  img.Image image = img.decodeImage(bitmap)!;

  // Calculate the new width and height with padding
  int newWidth = image.width + leftPadding + rightPadding;
  int newHeight = image.height + topPadding + bottomPadding;

  // Create a new image with added padding
  img.Image newImage = img.Image(width: newWidth, height: newHeight);

  newImage = img.fill(newImage, color: img.ColorUint8.rgba(0, 0, 0, 0));

  // Copy pixels from the original image to the new image
  for (int y = 0; y < image.height; y++) {
    for (int x = 0; x < image.width; x++) {
      final pixelColor = image.getPixel(x, y);
      newImage.setPixel(x + leftPadding, y + topPadding, pixelColor);
    }
  }

  // Encode the new image to Uint8List
  Uint8List result = Uint8List.fromList(img.encodePng(newImage)!);

  return result;
}

Future<Uint8List> assetToUint8List(String assetLocation, int width) async {
  ByteData data = await rootBundle.load(assetLocation);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

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
  const googelApiKey = 'AIzaSyDkxNsmr6MY8Aa-iDZx_9P8SJsmFs_4le8';

  GeoData data = await Geocoder2.getDataFromCoordinates(
    latitude: location.latitude,
    longitude: location.longitude,
    googleMapApiKey: googelApiKey,
  );
  return data.address;
}
