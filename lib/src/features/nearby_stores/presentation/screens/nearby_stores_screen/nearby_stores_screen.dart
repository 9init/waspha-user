import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:waspha/core/assets_gen/assets.gen.dart';
import 'package:waspha/core/localization/localization.dart';
import 'package:waspha/src/features/get_location/domain/get_location_domain.dart';
import 'package:waspha/src/features/nearby_stores/domain/location.dart';
import 'package:waspha/src/features/nearby_stores/presentation/screens/widgets/index.dart';

import '../../../../../widgets/nearby_store/nearby_store_widget.dart';
import '../../../domain/stores_repository.dart';

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
  StreamSubscription<dynamic>? nearbyStoresSubscription;
late LocationPermissionDialog locationPermissionDialog;
  @override
  void initState() {
    super.initState();
    isNearbyStoreScreenActive.value = true;
    Future.delayed(Duration(seconds: 1), () async {
      if (Platform.isIOS &&
          await AppTrackingTransparency.trackingAuthorizationStatus ==
              TrackingStatus.notDetermined) {
        locationPermissionDialog.showCustomTrackingDialog(context);
      } else {
        bool isDenied = await Permission.location.isGranted &&
            !await Permission.location.isRestricted;
        debugPrint("isDenied $isDenied");
        if (!isDenied) locationPermissionDialog.showPermissionDialog(context);
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    isNearbyStoreScreenActive.value = true;
    final isBottomSheetOpen = useState(false);
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final nearbyStores = ref.watch(
            getNearbyStoresStreamProvider(
              isBottomSheetOpen: isBottomSheetOpen,
            ),
          );
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
            if (!isPicking && markerLocation != null) {
              locationMarkers
                  .removeWhere((item) => item.markerId.value == 'user');
              locationMarkers.add(
                Marker(
                  markerId: MarkerId("user"),
                  position: markerLocation,
                  icon: BitmapDescriptor.fromBytes(
                    await assetToUint8List(
                      MyAssets.images.mapMarkers.user.path,
                      20,
                    ),
                    size: Size(50.w, 50.h),
                  ),
                ),
              );
            }
          });

          Future(() {
            ref.watch(locationStreamProvider).whenData((value) async {
              debugPrint("Location is $value");
              locationMarkers.removeWhere(
                  (element) => element.markerId.value == "gpsLocation");
              locationMarkers.add(
                Marker(
                  markerId: MarkerId("gpsLocation"),
                  position: LatLng(value.latitude!, value.longitude!),
                  infoWindow: InfoWindow(
                      title: context.localization.your_Location,
                      snippet: context.localization.you_are_here),
                  icon: BitmapDescriptor.fromBytes(
                    await assetToUint8List(
                      MyAssets.images.mapMarkers.user.path,
                      170.w.toInt(),
                    ),
                    size: Size(170.w, 170.h),
                  ),
                ),
              );
            });
          });

          return nearbyStores.when(
              skipLoadingOnReload: false,
              skipLoadingOnRefresh: false,
              data: (data) {
                debugPrint('Inside Success');
                markers.clear();
                final String message = data["message"];
                final List<dynamic> stores = data["stores"] ?? [];
                List categories = data["categories"];

                Future(() {
                  ref
                      .watch(getStoresProvider.notifier)
                      .update((state) => stores);
                });

                for (var store in stores.toSet()) {
                  final image =
                      ref.watch(imageBytesProvider(store.image)).value;

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
                    stores:
                        stores.where((cat) => cat.has_menu == true).toList(),
                    onMapCreated: (controller) {},
                    message: message,
                    categoryName: categories,
                    markers: [...locationMarkers, ...markers].toSet());
                // return Container(color: Colors.green,width: 200,height: 200,);
              },
              error: (error, stackTrace) {
                log("Nearby Error: ",
                    error: error, level: 4, stackTrace: stackTrace);

                return SnackBar(
                    content: Text(context.localization.error_happened));
              },
              loading: () {
                debugPrint('Inside Loading');
                return NearbyStoreMap(
                    isBottomSheetOpen: false,
                    stores: [],
                    initialLocation: LatLng(latitude, longitude),
                    dataLength: 0,
                    onMapCreated: (controller) => {},
                    message: context.localization.loading,
                    categoryName: [],
                    markers: locationMarkers.toSet());
              });
        },
      ),
    );
  }
}
