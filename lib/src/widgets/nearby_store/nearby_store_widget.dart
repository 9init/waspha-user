import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/login/domain/login_domain.dart';
import 'package:waspha/src/features/menu/presentation/menu.dart';
import 'package:waspha/src/features/profile/domain/pickup_radius.domain.dart';
import 'package:waspha/src/widgets/nearby_store/domain/nearby_domain.dart';
import 'package:waspha/src/widgets/search/search_widget.dart';

import '../../features/custom_need/presentation/custom_need.dart';
import '../../features/get_location/domain/get_location_domain.dart';
import '../../features/likes/domain/likes_domain.dart';
import '../../features/nearby_stores/domain/stores_repository.dart';
import '../categories/categories_widget.dart';

final subCategoryIDProvider = StateProvider<int>((ref) => 0);

final subCategoryProvider =
    StateProvider<Map<String, String>>((ref) => {'name': '', 'image': ''});

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
    required this.onMapCreated,
    required this.stores,
  });

  final LatLng initialLocation;
  final Set<Marker> markers;
  final int dataLength;
  final String message;
  final List categoryName;
  final Set<Polygon>? polygons;
  final isBottomSheetOpen;
  final List stores;

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
    print(mapController);
  }

  @override
  Widget build(BuildContext context) {
    final isClicked = useState(false);
    final method = ref.watch(methodProvider);
    final category = useState(0);
    final radius = ref.watch(pickupRadiusProvider).pickupRadius * 1000;
    final isCategoryClicked = useState(false);
    final isSubCategoryClicked = useState(false);
    final subCatIndex = useState(0);
    final subCatsCloned = widget.categoryName.isEmpty
        ? useState([])
        : useState([...widget.categoryName[category.value].sub_categories]);
    final userLocation = useState<LatLng?>(null);
    final currentLocation = ref.watch(userLocationProvider).asData?.value;
    final isPicking = ref.watch(isPickingLocationProvider);
    final isNearbyClicked = useState(false);
    final mapType = useState<MapType>(MapType.normal);
    ref.listen(
        getUserLocationTempProvider,
        (_, newValue) => mapController?.animateCamera(
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
            circles: {
              Circle(
                  visible: method == 'pickup',
                  circleId: CircleId("circle"),
                  radius: radius,
                  strokeColor: Colors.transparent,
                  fillColor: Colors.purple.withOpacity(0.2),
                  center: currentLocation ?? LatLng(0.0, 0.0)),
            },
            mapType: mapType.value,
            markers: widget.markers,
            onCameraMove: (position) {
              userLocation.value = position.target;
            },
            onMapCreated: (controller) {
              _onMapCreated(controller);
              widget.onMapCreated?.call(controller);
            },
            myLocationButtonEnabled: false,
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
                padding: const EdgeInsets.only(bottom: 35),
                child: Image(
                  image:
                      AssetImage("assets/images/map_markers/destination.png"),
                  width: 50,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 10),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Visibility(
                  visible: !isPicking,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 25),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.face),
                                  SizedBox(width: 10),
                                  Consumer(
                                    builder: (context, ref, child) => SizedBox(
                                      height: 42,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: method,
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
                                          onChanged: (v) async {
                                            ref
                                                .read(methodProvider.notifier)
                                                .update(
                                                    (state) => v.toString());

                                            await ref
                                                .refresh(
                                                    getNearbyStoresStreamProvider(
                                                  context: context,
                                                  isBottomSheetOpen:
                                                      widget.isBottomSheetOpen,
                                                ))
                                                .value;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          ProfileAppBar(),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () async {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              useSafeArea: true,
                              builder: (context) => SearchWidget());
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(width: 3),
                              Text(widget.message),
                              SizedBox(width: 10),
                              GestureDetector(
                                  onTap: () async {
                                    if (userLocation.value == null) return;

                                    final details = await getPlaceDetails(ref,
                                        location: userLocation.value!);

                                    final result = await ref.read(
                                        addLocationFavProvider(
                                                location: userLocation.value!,
                                                address: details)
                                            .future);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("$result")));
                                  },
                                  child: Icon(Icons.favorite_border))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
                          mapType.value = mapType.value == MapType.normal
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
                        print(userLocation.value);
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
          Visibility(
            visible: isNearbyClicked.value,
            child: GestureDetector(
              onTap: () => isNearbyClicked.value = false,
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: !isPicking && !isNearbyClicked.value,
                  child: Padding(
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
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          isSubCategoryClicked.value = false;
                        },
                        child: Visibility(
                            visible: isClicked.value &&
                                !isPicking &&
                                !isNearbyClicked.value,
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
                                          final subCategory = widget
                                              .categoryName[category.value]
                                              .sub_categories[index];
                                          return GestureDetector(
                                            onTap: () {
                                              subCatIndex.value = index;
                                              isSubCategoryClicked.value = true;

                                              ref
                                                  .watch(subCategoryIDProvider
                                                      .notifier)
                                                  .update((state) =>
                                                      subCategory.id);
                                              ref
                                                  .watch(subCategoryProvider
                                                      .notifier)
                                                  .update((state) {
                                                return {
                                                  'name':
                                                      subCategory.name["en"],
                                                  'image':
                                                      subCategory.image ?? ''
                                                };
                                              });
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
                                ref
                                    .watch(getUserLocation.notifier)
                                    .update((state) => userLocation.value);
                                ref
                                    .read(isPickingLocationProvider.notifier)
                                    .update((state) => false);

                                ref.invalidate(getNearbyStoresProvider(
                                    context: context,
                                    isBottomSheetOpen:
                                        widget.isBottomSheetOpen));
                              },
                              child: Text("Confirm Location")),
                        ),
                      ),
                    ),
                    //TODO : flex: isSubCategoryClicked.value ? 0 : 1,

                    Visibility(
                        visible: isSubCategoryClicked.value &&
                            isClicked.value &&
                            !isPicking &&
                            !isNearbyClicked.value,
                        child: GestureDetector(
                          onTap: () {
                            isCategoryClicked.value = !isCategoryClicked.value;
                            isSubCategoryClicked.value =
                                !isSubCategoryClicked.value;
                          },
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => context.push('/custom_need_screen',
                                    extra: false),
                                child: Column(
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
                                        child: Image.asset(
                                            'assets/images/nearby/custom_need.png'),
                                      ),
                                    ),
                                    Text("Custom Need"),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  isNearbyClicked.value = true;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text("Nearby"),
                                          Icon(Icons.arrow_forward)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
                Visibility(
                  visible: isNearbyClicked.value,
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context.push('/menu-screen', extra: widget.stores);
                          },
                          child: Text("List View")),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 400,
                        height: 200,
                        child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: widget.stores.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 15,
                                ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  ref.read(itemsProvider).clear();

                                  context.push('/menu-detail',
                                      extra: widget.stores[index].id);
                                },
                                child: MenuCard(
                                    onFavored: () async {
                                      if (widget.stores[index]?.is_favorite) {
                                        widget.stores[index].is_favorite =
                                            false;
                                        ref.read(deleteStoreFavProvider(
                                            id: widget.stores[index].id));
                                        print("Deleted" +
                                            widget.stores[index].id.toString());
                                        ref.invalidate(getFavStoresProvider);
                                      } else {
                                        widget.stores[index].is_favorite = true;
                                        await ref.read(addStoreFavProvider(
                                            id: widget.stores[index].id));
                                        ref.invalidate(getFavStoresProvider);
                                      }
                                    },
                                    isFavored:
                                        widget.stores[index].is_favorite ??
                                            false,
                                    imageURl: widget.stores[index].image,
                                    rating: widget.stores[index].average_rating,
                                    favWidth: 270,
                                    companyName: widget
                                        .stores[index].business_name["en"]),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () => context.push('/notifications'),
            icon: Icon(Icons.notifications),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(CircleBorder()),
            )),
        SizedBox(
          width: 5,
        ),
        Consumer(
          builder: (context, ref, child) {
            final userData = ref.watch(getUserAvatarProvider);
            return userData.when(
                data: (data) {
                  return GestureDetector(
                    onTap: () => context.push('/profile'),
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(data ??
                          "https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg"),
                    ),
                  );
                },
                error: (e, s) {
                  return Text("Error");
                },
                loading: () => CircleAvatar(
                      child: Icon(Icons.person),
                    ));
          },
        )
      ],
    );
  }
}
