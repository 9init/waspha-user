import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/get_location/domain/get_location_domain.dart';
import 'package:waspha/src/widgets/get_location_text/get_location_text.dart';
import 'package:google_places_flutter/google_places_flutter.dart';

import '../../features/likes/domain/likes_domain.dart';

final currentPlaceDescription = StateProvider<String>((ref) {
  return "";
});

class SearchWidget extends ConsumerStatefulWidget {
  // final Future<void> Function() goToLocation;
  const SearchWidget({super.key});

  @override
  ConsumerState<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends ConsumerState<SearchWidget> {
  final String APIKEY = "AIzaSyDhcLh_fWE4yEscpdIKQ-AoJKrd5ycdwcU";
  TextEditingController searchController = TextEditingController();
  LatLng pickedLocation = LatLng(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    final tempLocation = ref.watch(getUserLocationTempProvider.notifier);
    final locations = ref.watch(getLocationsProvider);

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              GooglePlaceAutoCompleteTextField(
                textEditingController: searchController,
                isLatLngRequired: true,
                boxDecoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent),
                ),
                getPlaceDetailWithLatLng: (Prediction prediction) {
                  double lat = double.parse(prediction.lat ?? '0.0');
                  double lng = double.parse(prediction.lng ?? '0.0');
                  tempLocation.update((state) => LatLng(lat, lng));
                  // ref
                  //     .read(getUserLocationTempProvider.notifier)
                  //     .update((state) => LatLng(lat, lng));
                },
                itemClick: (Prediction prediction) async {
                  await ref
                      .read(currentPlaceDescription.notifier)
                      .update((state) => prediction.description ?? "");
                  await ref
                      .read(isPickingLocationProvider.notifier)
                      .update((state) => true);
                  if (context.mounted) context.pop();
                },
                itemBuilder: (context, index, prediction) {
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Search for a location"),
                debounceTime: 800,
                googleAPIKey: APIKEY,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: locations.when(
                  data: (data) {
                    if (data.isEmpty) return Container();
                    return Container(
                      height: 70,
                      color: Colors.black.withOpacity(0.05),
                      child: ListView.separated(
                        itemCount: data.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: VerticalDivider(),
                        ),
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Icon(Icons.home),
                              SizedBox(
                                width: 7,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${data[index].location_type}"),
                                  Container(
                                    width: 100,
                                    child: Text(
                                      "${data[index].title}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                  loading: () => Container(),
                  error: (e, s) {
                    print(e.toString());
                    return Container();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: GetLocationText(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
