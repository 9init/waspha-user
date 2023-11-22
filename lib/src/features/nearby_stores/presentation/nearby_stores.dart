import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:waspha/src/features/custom_need/presentation/custom_need.dart';
import 'package:waspha/src/features/get_location/domain/get_location_domain.dart';
import 'package:waspha/src/features/nearby_stores/domain/location.dart';

import '../../../widgets/nearby_store/nearby_store_widget.dart';
import '../domain/stores_repository.dart';

class NearbyStoreScreen extends StatefulHookConsumerWidget {
  const NearbyStoreScreen({super.key});

  @override
  ConsumerState<NearbyStoreScreen> createState() => _NearbyStoreScreenState();
}

class _NearbyStoreScreenState extends ConsumerState<NearbyStoreScreen> {
  LatLng? currentLocation;
  final List<Marker> markers = [];
  List menuCategories = [];
  final List<Marker> locationMarkers = [];

  Future<void> showCustomTrackingDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Dear User'),
        content: const Text(
          'We care about your privacy and data security.'
          'We use user tracking to provide personalized advertising.'
          'By allowing tracking, you help us improve your experience.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Permission.location.request();
              context.pop();
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  Future<void> showPermissionDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: const Text("Submit Exam"),
        content: Text(
            "We use your location to find nearby stores, categories and products for you."),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Permission.location.request();
            },
            child: const Text(
              "Allow",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () async {
      bool isGranted = await isLocationGranted();
      print("IS Granted: $isGranted");
      if (isGranted) return;

      if (Platform.isIOS) {
        showCustomTrackingDialog(context);
      } else {
        showPermissionDialog(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isBottomSheetOpen = useState(false);
    return Scaffold(body: Consumer(builder: (context, ref, child) {
      final nearbyStores = ref.watch(getNearbyStoresStreamProvider(
        context: context,
        isBottomSheetOpen: isBottomSheetOpen,
      ));
      final isPicking = false; // ref.watch(isPickingLocationProvider);
      final markerLocation = ref.watch(getUserLocation);

      double? latitude =
          ref.watch(locationStreamProvider).asData?.value.latitude;
      double? longitude =
          ref.watch(locationStreamProvider).asData?.value.longitude;

      if (latitude == null || longitude == null) {
        return Container();
      }

      Future(() async {
        if (!isPicking) {
          locationMarkers.removeWhere((item) => item.markerId.value == 'user');
          locationMarkers.add(
            Marker(
              markerId: MarkerId("user"),
              position: markerLocation,
              icon: BitmapDescriptor.fromBytes(
                await assetToUint8List(
                  "assets/images/map_markers/location.png",
                  135,
                ),
              ),
            ),
          );
        }
      });

      return nearbyStores.when(data: (data) {
        markers.clear();

        final String message = data["message"];
        final List<dynamic> stores = data["stores"] ?? [];
        List categories = data["categories"];

        Future(() {
          ref.watch(getStoresProvider.notifier).update((state) => stores);
        });

        for (var store in stores.toSet()) {
          final image = ref.watch(imageBytesProvider(store.image)).value;

          markers.add(
            Marker(
              icon: image != null
                  ? image
                  : BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueViolet),
              markerId: MarkerId(store.id.toString()),
              position: LatLng(store.lat, store.lng),
              infoWindow: InfoWindow(
                title: store.business_name["en"],
                snippet: store.average_rating.toString(),
              ),
            ),
          );
        }
        return NearbyStoreMap(
            isBottomSheetOpen: isBottomSheetOpen,
            initialLocation: LatLng(data["lat"], data["lng"]),
            dataLength: categories.length,
            stores: stores.where((cat) => cat.has_menu == true).toList(),
            onMapCreated: (controller) {},
            message: message,
            categoryName: categories,
            markers: [...locationMarkers, ...markers].toSet());
      }, error: (error, stackTrace) {
        log("Nearby Error: ", error: error, level: 4, stackTrace: stackTrace);

        return SnackBar(content: Text("Error Happened"));
      }, loading: () {
        return NearbyStoreMap(
            isBottomSheetOpen: false,
            stores: [],
            initialLocation: LatLng(latitude!, longitude!),
            dataLength: 0,
            onMapCreated: (controller) async {
              if (locationMarkers
                  .any((element) => element.markerId.value == "gpsLocation")) {
                return;
              }

              locationMarkers.add(
                Marker(
                  markerId: MarkerId("gpsLocation"),
                  position: LatLng(await latitude, await longitude),
                  infoWindow: InfoWindow(
                      title: "Your Location", snippet: "You are here"),
                  icon: BitmapDescriptor.fromBytes(await assetToUint8List(
                    "assets/images/map_markers/user.png",
                    135,
                  )),
                ),
              );
            },
            message: "Loading...",
            categoryName: [],
            markers: locationMarkers.toSet());
      });
    }));
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    this.isLogged = false,
    required this.content,
  });

  final bool isLogged;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: isLogged
          ? Text("Need login")
          : Align(alignment: Alignment.topRight, child: CustomCloseButton()),
      actions: isLogged
          ? [
              TextButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.black),
                  )),
            ]
          : [],
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.lightbulb_outline),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(content),
          ),
        ],
      ),
    );
  }
}
