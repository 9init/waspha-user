import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/buffer_brand/presentation/cancellation_reasons_bottom_sheet.dart';
import '../../nearby_stores/domain/stores_repository.dart';

class BufferBrand extends ConsumerWidget {
  final int rfpID;
  const BufferBrand({super.key, required this.rfpID});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, child) {
            final location = ref.watch(userLocationProvider);
            final List<dynamic> stores = ref.watch(getStoresProvider);

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
                              zoomGesturesEnabled: false,
                              scrollGesturesEnabled: false,
                              tiltGesturesEnabled: false,
                              rotateGesturesEnabled: false,
                              zoomControlsEnabled: false,
                              markers: {
                                Marker(
                                    markerId: MarkerId('1'),
                                    position: data,
                                    icon: BitmapDescriptor.defaultMarkerWithHue(
                                        BitmapDescriptor.hueBlue)),
                                ...stores.map((e) {
                                  final image = ref
                                      .watch(imageBytesProvider(e.image))
                                      .value;

                                  return Marker(
                                      markerId: MarkerId(e.id.toString()),
                                      position: LatLng(e.lat, e.lng),
                                      icon: image != null
                                          ? image
                                          : BitmapDescriptor
                                              .defaultMarkerWithHue(
                                                  BitmapDescriptor.hueRed));
                                })
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Container(
                                height: 38,
                                child: ListView.builder(
                                    itemCount:
                                        stores.length > 5 ? 5 : stores.length,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return AnimatedAlign(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeIn,
                                        alignment: Alignment.centerLeft,
                                        widthFactor: 0.6,
                                        child: CircleAvatar(
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                                  stores[index].image),
                                        ),
                                      );
                                    }),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: stores.length == 5 ? 0 : 30),
                                  child: Text(
                                    stores.length > 5
                                        ? "+${stores.length - 5}"
                                        : stores.length == 1
                                            ? stores[0].address
                                            : "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
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
                                showModalBottomSheet(
                                    context: context,
                                    backgroundColor: Colors.white,
                                    isScrollControlled: true,
                                    useSafeArea: false,
                                    builder: (context) {
                                      return CancellationReasonsBottomSheet(
                                        rfpID: rfpID,
                                      );
                                    });
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
      ),
    );
  }
}
