import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/core/di/index.dart';
import 'package:waspha/src/features/likes/helpers/get_address_location.dart';

import '../../../../core/const/cahce_keys/cache_keys.dart';
import '../../nearby_stores/domain/stores_repository.dart';

final getChosenLocationProvider =
    StateProvider<Map<String, dynamic>?>((ref) => null);

class ChooseLocation extends StatefulHookWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  GoogleMapController? mapController;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userLocation = useState(LatLng(0.0, 0.0));
    final mapType = useState<MapType>(MapType.normal);
    final userLocationBox = Hive.box(CacheKeys.userLocation);
    final savedLatitude =  di<GetAddressLocation>().savedLatitude ;
    final savedLongitude =  di<GetAddressLocation>().savedLongitude ;
    final savedAddress =  di<GetAddressLocation>().savedAddress;
    debugPrint('The Saved Value Is $savedLatitude');
    debugPrint('The Saved Value Is $savedLongitude');
    debugPrint('The Saved Value Is $savedAddress');

    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final location = ref.read(userLocationProvider);
        final currentLocation = ref.read(userLocationProvider).asData?.value;

        return location.when(
            data: (data) {
              debugPrint('The Data Is $data');
              return Stack(
                alignment: Alignment.center,
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: savedLongitude == 0.0 && savedLatitude == 0.0
                          ? data!
                          : LatLng(savedLatitude, savedLongitude),
                      zoom: 14.4746,
                    ),
                    myLocationEnabled: false,
                    mapType: mapType.value,
                    myLocationButtonEnabled: false,
                    onMapCreated: (controller) {
                      _onMapCreated(controller);
                    },
                    zoomGesturesEnabled: true,
                    onCameraMove: (position) => userLocation.value = LatLng(
                      position.target.latitude,
                      position.target.longitude,
                    ),
                    scrollGesturesEnabled: true,
                    tiltGesturesEnabled: false,
                    markers: {
                      Marker(
                        markerId: MarkerId("user"),
                        position: savedLongitude == 0.0 && savedLatitude == 0.0
                            ? data!
                            : LatLng(savedLatitude, savedLongitude),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueBlue),
                      ),
                    },
                    rotateGesturesEnabled: true,
                    zoomControlsEnabled: false,
                  ),
                  Image.asset('assets/images/map_markers/destination.png',
                      width: 50.w),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: () {
                                  mapType.value =
                                      mapType.value == MapType.normal
                                          ? MapType.satellite
                                          : MapType.normal;
                                },
                                icon: Icon(mapType.value == MapType.normal
                                    ? Icons.satellite_alt
                                    : Icons.public)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () async {
                                await mapController?.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                        target: currentLocation!, zoom: 14.74),
                                  ),
                                );
                              },
                              icon: Icon(Icons.gps_fixed),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              final details = await getPlaceDetails(ref,
                                  location: userLocation.value);
                              ref
                                  .read(getChosenLocationProvider.notifier)
                                  .state = {
                                "lat": userLocation.value.latitude,
                                "lng": userLocation.value.longitude,
                                "address": details
                              };
                              debugPrint(
                                  'userLocation.value.latitude${userLocation.value.latitude}');
                              debugPrint(
                                  'userLocation.value.longitude${userLocation.value.longitude}');
                              // di<SharedPreferences>()
                              await userLocationBox.put(CacheKeys.userLatitude,
                                  userLocation.value.latitude);
                              await userLocationBox.put(CacheKeys.userLongitude,
                                  userLocation.value.longitude);
                              await userLocationBox.put(
                                  CacheKeys.userAddress, details);
                           di<GetAddressLocation>().savedLatitude = userLocation.value.latitude;
                           di<GetAddressLocation>().savedLongitude = userLocation.value.longitude;
                           di<GetAddressLocation>().savedAddress = details;
                              context.pop();
                            },
                            child: Text("Confirm Location"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            error: (e, s) {
              return Text("Error");
            },
            loading: () => CircularProgressIndicator());
      }),
    );
  }
}
