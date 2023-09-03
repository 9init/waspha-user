import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/get_location/domain/get_location_domain.dart';

import '../../../widgets/nearby_store/nearby_store_widget.dart';
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
    return Scaffold(body: Consumer(builder: (context, ref, child) {
      final nearbyStores = ref.watch(getNearbyStoresStreamProvider(
          context: context, isBottomSheetOpen: isBottomSheetOpen));
      return nearbyStores.when(
          data: (data) {
            final String message = data["message"];
            final stores = data["stores"];
            final categories = data["categories"];

            return NearbyStoreMap(
                isBottomSheetOpen: isBottomSheetOpen,
                lat: data["lat"],
                long: data["lng"],
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
                onCameraMove: (position) {
                  try {
                    ref.watch(getUserLocation.notifier).update((state) => LatLng(
                      position.target.latitude, position.target.longitude));
                  } catch (e) {
                    print(e);
                  }

                  print(position.target);
                },
                markers: markers.toSet());
          },
          error: (error, stackTrace) {
            log("Nearby Error", error: error, level: 4, stackTrace: stackTrace);
            print(error);
            print(stackTrace);
            return SnackBar(content: Text("Error Happened"));
          },
          loading: () => Center(child: CircularProgressIndicator()));
    }));
  }
}
