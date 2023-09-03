import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/widgets/search/search_widget.dart';

import '../../features/nearby_stores/domain/stores_repository.dart';
import '../categories/categories_widget.dart';

class NearbyStoreMap extends HookWidget {
  NearbyStoreMap({
    super.key,
    required this.lat,
    required this.long,
    required this.markers,
    required this.message,
    required this.categoryName,
    required this.dataLength,
    this.polygons,
    required this.isBottomSheetOpen,
    required this.onCameraMove,
    required this.onMapCreated,
  });

  final double? lat;
  final double? long;
  final Set<Marker> markers;
  final int dataLength;
  final String message;
  final List categoryName;
  final Set<Polygon>? polygons;
  final isBottomSheetOpen;
  final Function(CameraPosition)? onCameraMove;
  final Function(GoogleMapController)? onMapCreated;


  @override
  Widget build(BuildContext context) {
    final isClicked = useState(false);
    final method = useState('delivery');
    final category = useState(0);
    final isCategoryClicked = useState(false);
    final isSubCategoryClicked = useState(false);
    final subCatIndex = useState(0);
    final subCatsCloned = categoryName.isEmpty
        ? useState([])
        : useState([...categoryName[category.value].sub_categories]);

    return SafeArea(
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(lat ?? 0.0, long ?? 0.0),
              zoom: 14.4746,
            ),
            polygons: polygons ?? {},
            mapType: MapType.normal,
            markers: markers,
            onCameraMove: onCameraMove,
            onMapCreated: onMapCreated,
            myLocationEnabled: false,
            zoomGesturesEnabled: true,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: false,
            rotateGesturesEnabled: true,
            zoomControlsEnabled: false,
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              child: Icon(Icons.approval),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 25),
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
                                      isBottomSheetOpen: isBottomSheetOpen))
                                  .value;
                              ;
                            },
                          ),
                        ),
                      ],
                    )),
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
                    onPressed: () {
                      showModalBottomSheet(
                          showDragHandle: true,
                          enableDrag: true,
                          isScrollControlled: true,
                          context: context,
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
                  Text(message),
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
                  child: categoryName.isNotEmpty
                      ? CategoriesWidget(
                          isClicked: isClicked,
                          isSubCategoryClicked: isSubCategoryClicked,
                          dataLength: dataLength,
                          category: category,
                          categoryName: categoryName)
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
                            child: categoryName.isNotEmpty
                                ? Container(
                                    height: 110,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: ListView.separated(
                                        itemCount: categoryName[category.value]
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
                                                  ...categoryName[
                                                          category.value]
                                                      .sub_categories
                                                ];
                                                subCatsCloned.value.removeAt(
                                                    subCatIndex.value);
                                                subCatsCloned.value.add(
                                                    categoryName[category.value]
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
                                                                : categoryName[category
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
                                                            : categoryName[
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
