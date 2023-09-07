import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/widgets/search/search_widget.dart';

import '../../features/get_location/domain/get_location_domain.dart';
import '../../features/nearby_stores/domain/stores_repository.dart';
import '../categories/categories_widget.dart';

class NearbyStoreMap extends StatefulHookConsumerWidget {
  NearbyStoreMap({
    super.key,
    required this.initialLocation,
    required this.markers,
    required this.message,
    required this.categoryName,
    required this.dataLength,
    this.polygons,
    required this.isBottomSheetOpen,
    required this.onCameraMove,
    required this.onMapCreated,
    required this.onCameraIdle,
  });

  final LatLng initialLocation;
  final Set<Marker> markers;
  final int dataLength;
  final String message;
  final List categoryName;
  final Set<Polygon>? polygons;
  final isBottomSheetOpen;
  final Function()? onCameraIdle;
  final Function(CameraPosition)? onCameraMove;

  final Function(GoogleMapController)? onMapCreated;

  @override
  ConsumerState<NearbyStoreMap> createState() => _NearbyStoryMapState();
}

class _NearbyStoryMapState extends ConsumerState<NearbyStoreMap> {
  GoogleMapController? mapController;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isClicked = useState(false);
    final method = useState('delivery');
    final category = useState(0);
    final isCategoryClicked = useState(false);
    final isSubCategoryClicked = useState(false);
    final subCatIndex = useState(0);
    final subCatsCloned = widget.categoryName.isEmpty
        ? useState([])
        : useState([...widget.categoryName[category.value].sub_categories]);
    final userLocation = useState(LatLng(0.0, 0.0));
    final isPicking = ref.watch(isPickingLocationProvider);
    final isSelectLocation = ref.watch(isLocationSelectedProvider);
    ref.listen(
        getUserLocationTempProvider,
        (oldValue, newValue) => mapController?.animateCamera(
            CameraUpdate.newCameraPosition(
                CameraPosition(target: newValue, zoom: 14.74))));
    return SafeArea(
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.initialLocation,
              zoom: 14.4746,
            ),
            polygons: widget.polygons ?? {},
            mapType: MapType.normal,
            markers: widget.markers,
            onCameraMove: (position) {
              userLocation.value = position.target;
            },
            onMapCreated: (controller) => _onMapCreated(controller),
            myLocationEnabled: false,
            zoomGesturesEnabled: true,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: false,
            rotateGesturesEnabled: true,
            zoomControlsEnabled: false,
          ),
          Visibility(
            visible: isPicking,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Icon(
                  Icons.location_on,
                  size: 50,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: !isPicking,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 3, horizontal: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.face),
                          SizedBox(width: 10),
                          Consumer(
                            builder: (context, ref, child) => DropdownButton(
                              underline: SizedBox(),
                              value: method.value,
                              items: [
                                DropdownMenuItem(
                                  child: Text("Pickup"),
                                  value: "pickup",
                                ),
                                DropdownMenuItem(
                                  child: Text("Delivery"),
                                  value: "delivery",
                                ),
                              ],
                              onChanged: (v) {
                                ref
                                    .read(methodProvider.notifier)
                                    .update((state) => v.toString());
                                method.value = v.toString();
                                ref
                                    .refresh(getNearbyStoresProvider(
                                        context: context,
                                        isBottomSheetOpen:
                                            widget.isBottomSheetOpen,
                                        userLocation: userLocation))
                                    .value;
                                ;
                              },
                            ),
                          ),
                        ],
                      )),
                ),
                SizedBox(width: 100),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(CircleBorder()),
                    )),
                SizedBox(width: 5),
                CircleAvatar(
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: Icon(Icons.person),
                  ),
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                    onPressed: () async {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) => SearchWidget());
                    },
                    icon: Icon(Icons.search)),
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 15,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.download),
                  SizedBox(width: 3),
                  Text(widget.message),
                  SizedBox(width: 10),
                  Icon(Icons.favorite_border)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: widget.categoryName.isNotEmpty
                      ? CategoriesWidget(
                          isClicked: isClicked,
                          isSubCategoryClicked: isSubCategoryClicked,
                          dataLength: widget.dataLength,
                          category: category,
                          categoryName: widget.categoryName)
                      : Container(),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        isSubCategoryClicked.value = false;
                      },
                      child: Flexible(
                        child: Visibility(
                            visible: isClicked.value,
                            child: widget.categoryName.isNotEmpty
                                ? Container(
                                    height: 110,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: ListView.separated(
                                        itemCount: widget
                                            .categoryName[category.value]
                                            .sub_categories
                                            .length,
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              width: 10,
                                            ),
                                        padding: EdgeInsets.only(left: 10),
                                        itemBuilder: (context, index) {
                                          final int subCatLength =
                                              subCatsCloned.value.length;
                                          return GestureDetector(
                                            onTap: () {
                                              subCatIndex.value = index;
                                              isSubCategoryClicked.value = true;

                                              if (isSubCategoryClicked.value) {
                                                subCatsCloned.value = [
                                                  ...widget
                                                      .categoryName[
                                                          category.value]
                                                      .sub_categories
                                                ];
                                                subCatsCloned.value.removeAt(
                                                    subCatIndex.value);
                                                subCatsCloned.value.add(widget
                                                        .categoryName[
                                                            category.value]
                                                        .sub_categories[
                                                    subCatIndex.value]);
                                              }
                                            },
                                            child: AnimatedAlign(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              curve: Curves.easeIn,
                                              alignment: Alignment.centerLeft,
                                              widthFactor:
                                                  isSubCategoryClicked.value
                                                      ? 0.1
                                                      : 1,
                                              child: Column(
                                                children: [
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.black,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      child: CircleAvatar(
                                                          radius: 40,
                                                          backgroundColor:
                                                              Colors.white,
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl: isSubCategoryClicked
                                                                    .value
                                                                ? subCatsCloned
                                                                        .value[
                                                                            index]
                                                                        .image ??
                                                                    ""
                                                                : widget
                                                                        .categoryName[category
                                                                            .value]
                                                                        .sub_categories[
                                                                            index]
                                                                        .image ??
                                                                    "",
                                                            imageBuilder: (context,
                                                                    imageProvider) =>
                                                                Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                image: DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover),
                                                              ),
                                                            ),
                                                            placeholder: (context,
                                                                    url) =>
                                                                CircularProgressIndicator(),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                Icon(Icons
                                                                    .broken_image),
                                                          ))),
                                                  Visibility(
                                                      visible: !isSubCategoryClicked
                                                              .value ||
                                                          (index ==
                                                                  subCatLength -
                                                                      1 &&
                                                              isSubCategoryClicked
                                                                  .value),
                                                      child: Text(
                                                        isSubCategoryClicked
                                                                .value
                                                            ? subCatsCloned
                                                                .value[index]
                                                                .name["en"]
                                                            : widget
                                                                .categoryName[
                                                                    category
                                                                        .value]
                                                                .sub_categories[
                                                                    index]
                                                                .name["en"],
                                                      )),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                : Container()),
                      ),
                    ),
                    Visibility(
                      visible: isPicking,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () async {
                                ref.watch(getUserLocation.notifier).update(
                                    (state) =>
                                        ref.watch(getUserLocationTempProvider));
                                ref
                                    .read(isPickingLocationProvider.notifier)
                                    .update((state) => false);
                                await ref
                                    .refresh(getNearbyStoresProvider(
                                        context: context,
                                        isBottomSheetOpen:
                                            widget.isBottomSheetOpen,
                                        userLocation: userLocation))
                                    .value;
                                // await goToLocation();
                                print("User Location: ${userLocation.value}");
                              },
                              child: Text("Confirm Location")),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: isSubCategoryClicked.value ? 0 : 1,
                      child: Visibility(
                          visible:
                              isSubCategoryClicked.value && isClicked.value,
                          child: GestureDetector(
                            onTap: () {
                              isCategoryClicked.value =
                                  !isCategoryClicked.value;
                              isSubCategoryClicked.value =
                                  !isSubCategoryClicked.value;
                            },
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.person),
                                      ),
                                    ),
                                    Text("Custom Need"),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.person),
                                      ),
                                    ),
                                    Text("Nearby"),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
