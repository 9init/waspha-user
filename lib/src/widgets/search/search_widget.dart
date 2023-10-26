import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/get_location/domain/get_location_domain.dart';
import 'package:waspha/src/widgets/get_location_text/get_location_text.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

final currentPlaceDescription = StateProvider<String>((ref) {
  return "";
});

class SearchWidget extends HookWidget {
  // final Future<void> Function() goToLocation;
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const String APIKEY = "AIzaSyDhcLh_fWE4yEscpdIKQ-AoJKrd5ycdwcU";
    TextEditingController searchController = TextEditingController();

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, child) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                GooglePlaceAutoCompleteTextField(
                    textEditingController: searchController,
                    boxDecoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent)),
                    getPlaceDetailWithLatLng: (Prediction prediction) async {
                      double lat = double.parse(prediction.lat ?? '0.0');
                      double lng = double.parse(prediction.lng ?? '0.0');
                      print("LAT: $lat");
                      ref
                          .watch(getUserLocationTempProvider.notifier)
                          .update((state) => LatLng(lat, lng));
                    },
                    itemClick: (Prediction prediction) async {
                      context.pop();
                      await ref
                          .watch(currentPlaceDescription.notifier)
                          .update((state) => prediction.description ?? "");
                      await ref
                          .watch(isPickingLocationProvider.notifier)
                          .update((state) => true);
                    },
                   
                    itemBuilder: (context, index, prediction) {
                      print("LAT2 : ${prediction.lat ?? '0.0'}");
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            color: Color.fromRGBO(243, 241, 251, 1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                Divider(),
                                if (index == 4) GetLocationText()
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    inputDecoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Search for a location"),
                    debounceTime: 800,
                    googleAPIKey: APIKEY),
                Padding(
                  padding: const EdgeInsets.only(left:20),
                  child: GetLocationText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
