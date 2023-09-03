import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/nearby_stores/domain/location.dart';


class SearchWidget extends HookWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const String APIKEY = "AIzaSyDhcLh_fWE4yEscpdIKQ-AoJKrd5ycdwcU";
    TextEditingController searchController = TextEditingController();

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: GooglePlaceAutoCompleteTextField(
                    textEditingController: searchController,
                    getPlaceDetailWithLatLng: (Prediction prediction) {},
                    itemClick: (Prediction prediction) {
                      searchController.text = prediction.description ?? "";
                      searchController.selection = TextSelection.fromPosition(
                          TextPosition(offset: prediction.description!.length));
                    },
                    seperatedBuilder: Divider(),
                    itemBuilder: (context, index, prediction) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (index == 0)
                                  Text("Searching...",
                                      style: TextStyle(fontSize: 18)),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(Icons.location_on),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Expanded(
                                        child: Text(
                                            "${prediction.description ?? ""}")),
                                  ],
                                ),
                                if (index == 4)
                                  Column(
                                    children: [
                                      Divider(),
                                      Consumer(
                                        builder: (context, ref, child) =>
                                            GestureDetector(
                                          onTap: () => context.pushNamed(
                                              'Get Location Map',
                                              pathParameters: {
                                                'lat': ref
                                                        .watch(
                                                            locationStreamProvider)
                                                        .value
                                                        ?.latitude
                                                        .toString() ??
                                                    '0.0',
                                                'lng': ref
                                                        .watch(
                                                            locationStreamProvider)
                                                        .value
                                                        ?.longitude
                                                        .toString() ??
                                                    '0.0',
                                              }),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.location_on),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                        "Select location from map")),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    inputDecoration: InputDecoration(),
                    debounceTime: 800,
                    googleAPIKey: APIKEY),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
