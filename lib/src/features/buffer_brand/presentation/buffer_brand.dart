import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../nearby_stores/domain/stores_repository.dart';

class BufferBrand extends StatelessWidget {
  const BufferBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final location = ref.watch(userLocationProvider);
          return location.when(
              data: (data) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 500,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: GoogleMap(
                            zoomControlsEnabled: false,
                            zoomGesturesEnabled: false,
                            markers: {
                              Marker(
                                  markerId: MarkerId('1'),
                                  position: data,
                                  icon: BitmapDescriptor.defaultMarkerWithHue(
                                      BitmapDescriptor.hueBlue))
                            },
                            circles: {
                              Circle(
                                  circleId: CircleId('1'),
                                  center: LatLng(30.0444, 31.2357),
                                  radius: 300,
                                  fillColor: Colors.blue.withOpacity(0.1),
                                  strokeWidth: 0,
                                  strokeColor: Colors.transparent),
                              Circle(
                                  circleId: CircleId('2'),
                                  center: LatLng(30.0444, 31.2357),
                                  radius: 400,
                                  fillColor: Colors.blue.withOpacity(0.13),
                                  strokeWidth: 0,
                                  strokeColor: Colors.transparent),
                            },
                            initialCameraPosition: CameraPosition(
                              target: data,
                              zoom: 14.4746,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Offers may be recieved from"),
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                        ),
                        title: Text("Amazon Egypt Brand"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Offers may be recieved within"),
                      ),
                      SizedBox(height: 5),
                      ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.lock_clock),
                        ),
                        title: Text("56h:08m:23s"),
                      ),
                      Center(
                        child: ToggleButtons(
                          borderWidth: 0,
                          constraints:
                              BoxConstraints(minWidth: 150, minHeight: 50),
                          borderColor: Colors.transparent,
                          disabledColor: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                          textStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.red,
                          children: [
                            Text("Go to Activity"),
                            Text(
                              "Cancel my request",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                          onPressed: (index) {
                            if (index == 0) {
                              context.go('/activity');
                            } else {
                              context.go('/');
                            }
                          },
                          isSelected: [false, true],
                        ),
                      )
                    ],
                  ),
              error: (e, s) {
                log("Buffer Error: $e");
                return Container();
              },
              loading: () => CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
