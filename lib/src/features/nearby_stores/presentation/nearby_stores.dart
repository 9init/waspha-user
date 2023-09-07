import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/get_location/domain/get_location_domain.dart';

import '../../../widgets/nearby_store/nearby_store_widget.dart';
import '../domain/location.dart';
import '../domain/stores_repository.dart';

class NearbyStoreScreen extends StatefulHookWidget {
  const NearbyStoreScreen({super.key});

  @override
  State<NearbyStoreScreen> createState() => _NearbyStoreScreenState();
}

class _NearbyStoreScreenState extends State<NearbyStoreScreen> {
  final List<Marker> markers = [];
  @override
  Widget build(BuildContext context) {
    final isBottomSheetOpen = useState(false);
    final userLocation = useState(LatLng(0.0, 0.0));

    return Scaffold(body: Consumer(builder: (context, ref, child) {
      final nearbyStores = ref.watch(getNearbyStoresStreamProvider(
          context: context,
          isBottomSheetOpen: isBottomSheetOpen,
          userLocation: userLocation));
      final userlat = ref.watch(locationStreamProvider).requireValue.latitude;
      final userLng = ref.watch(locationStreamProvider).requireValue.longitude;
      final isPicking = ref.watch(isPickingLocationProvider);
      final markerLocation = ref.watch(getUserLocation);

      if (!isPicking) {
        markers.add(Marker(
            markerId: MarkerId("user"),
            position: markerLocation,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueBlue)));
      }
      return nearbyStores.when(
          data: (data) {
            final String message = data["message"];
            final stores = data["stores"] ?? [];
            final categories = data["categories"];

            return NearbyStoreMap(
                isBottomSheetOpen: isBottomSheetOpen,
                initialLocation: LatLng( data["lat"],data["lng"]),
                dataLength: categories.length,
                onMapCreated: (controller) {
                  if (stores == []) {
                    markers.clear();
                  } else {
                    for (var i = 0; i < stores.length; i++) {
                      markers.add(Marker(
                          markerId: MarkerId(stores[i].id.toString()),
                          position: LatLng(stores[i].lat, stores[i].lng),
                          infoWindow: InfoWindow(
                              title: stores[i].business_name["en"],
                              snippet: stores[i].average_rating.toString())));
                    }
                  }
                },
                message: message,
                categoryName: categories,
                onCameraIdle: () {},
                onCameraMove: (position) {},
                markers: markers.toSet());
          },
          error: (error, stackTrace) {
            log("Nearby Error: ",
                error: error, level: 4, stackTrace: stackTrace);

            return SnackBar(content: Text("Error Happened"));
          },
          loading: () => NearbyStoreMap(
              isBottomSheetOpen: false,
              
              initialLocation: LatLng(userlat ?? 0.0, userLng ?? 0.0),
              dataLength: 0,
              onMapCreated: (controller) {},
              message: "Loading...",
              categoryName: [],
              onCameraIdle: () {},
              onCameraMove: (position) {},
              markers: markers.toSet()));
    }));
  }
}
