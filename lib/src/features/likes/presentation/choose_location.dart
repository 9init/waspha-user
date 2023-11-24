import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final location = ref.read(userLocationProvider);
        final currentLocation = ref.read(userLocationProvider).asData?.value;

        return location.when(
            data: (data) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: data!,
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
                        position: data,
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueBlue),
                      ),
                    },
                    rotateGesturesEnabled: true,
                    zoomControlsEnabled: false,
                  ),
                  Icon(Icons.location_on, color: Colors.red, size: 50),
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
                              // ref.refresh(getChosenLocationProvider);
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
