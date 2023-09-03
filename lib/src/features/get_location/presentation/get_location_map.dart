import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:waspha/src/features/nearby_stores/domain/stores_repository.dart';

class GetLocationMapScreen extends HookWidget {
  final double userLat;
  final double userLng;
  const GetLocationMapScreen(
      {super.key, required this.userLat, required this.userLng});

  @override
  Widget build(BuildContext context) {
    final userLat = useState(0.0);
    final userLng = useState(0.0);
    return Scaffold(
        appBar: AppBar(
          title: Text('Get Location Map'),
        ),
        body: FutureBuilder(
            future: getLocation(),
            builder: (context, AsyncSnapshot<LocationData> snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    GoogleMap(
                      myLocationEnabled: false,
                      zoomGesturesEnabled: true,
                      scrollGesturesEnabled: true,
                      tiltGesturesEnabled: false,
                      rotateGesturesEnabled: true,
                      zoomControlsEnabled: false,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(snapshot.data!.latitude!,
                            snapshot.data!.longitude!),
                        zoom: 14.4746,
                      ),
                      markers: {
                        Marker(
                          onTap: () => print('marker tapped'),
                          markerId: MarkerId('1'),
                          draggable: true,
                          infoWindow: InfoWindow(title: 'User Location'),
                          onDragEnd: (newPosition) {
                            userLat.value = newPosition.latitude;
                            userLng.value = newPosition.longitude;
                          },
                          position: LatLng(
                            userLat.value != 0.0
                                ? userLat.value
                                : snapshot.data!.latitude!,
                            userLng.value != 0.0
                                ? userLng.value
                                : snapshot.data!.longitude!,
                          ),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueBlue,
                          ),
                        ),
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 50,
                        child: Consumer(
                          builder: (context, ref, child) => ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFFF663399)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                              onPressed: () {
                                context.pop();
                              },
                              child: Text("Confirm Location",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white))),
                        ),
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
