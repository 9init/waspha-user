import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/nearby_store/domain/nearby_domain.dart';
import '../../../widgets/nearby_store/nearby_store_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, required this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ProfileAppBar(),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                MenuContainer(
                  rowWidgets: [
                    Center(child: Text("El Dokki, Giza, Egypt")),
                    Icon(Icons.settings),
                  ],
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // MenuContainer(
                //   rowWidgets: [
                //     Icon(Icons.search),
                //     Center(child: Text("Find Provider")),
                //   ],
                // ),
                SizedBox(height: 20),
                Container(
                  child: ListView.separated(
                    itemCount: data.length,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () =>
                            context.push('/menu-detail', extra: data[index].id),
                        child: Consumer(
                          builder: (context, ref, child) {
                            return MenuCard(
                              rating: data[index].average_rating,
                              isListView: true,
                              onFavored: () async {
                                if (data[index].is_favorite) {
                                  await ref.read(deleteStoreFavProvider(
                                      id: data[index].id));
                                  ref.invalidate(getFavStoresProvider);
                                  print("Removed from favs");
                                } else {
                                  await ref
                                      .read(addStoreFavProvider(
                                              id: data[index].id)
                                          .future)
                                      .then((value) {
                                    if (value) {
                                      print("Added to favs");
                                      ref.invalidate(getFavStoresProvider);
                                    }
                                  });
                                }
                              },
                              isFavored: data[index].is_favorite ?? false,
                              imageURl: data[index].image,
                              companyName: data[index].business_name["en"],
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: Text("Menu View"),
            )
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
    required this.imageURl,
    required this.companyName,
    this.isOffer = false,
    this.width = 0.9,
    required this.onFavored,
    this.favWidth = 250,
    this.isProvider = false,
    this.isFavored = false,
    this.isListView = false,
    this.rating = 0,
  });

  final String imageURl;
  final String companyName;
  final bool isOffer, isProvider;
  final double width, favWidth;
  final void Function()? onFavored;
  final bool isFavored;
  final bool isListView;
  final double rating;

  double dynamicWidth(BuildContext context) {
    if (isOffer) {
      return 150;
    } else if (isProvider) {
      return 1040.w;
    } else if (isListView) {
      return 1290.w;
    }
    return 1100.w;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: [
          Container(
            width: dynamicWidth(context),
            height: isOffer ? 150 : 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(imageURl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: dynamicWidth(context),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: isProvider
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))
                            : BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: isOffer
                            ? const EdgeInsets.only(left: 20)
                            : const EdgeInsets.all(0),
                        child: Row(
                          mainAxisAlignment: !isOffer
                              ? MainAxisAlignment.spaceAround
                              : MainAxisAlignment.start,
                          children: [
                            !isOffer ? Icon(Icons.abc) : Container(),
                            Container(
                              width: 130,
                              child: Text(
                                companyName,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ),
                            !isOffer ? Icon(Icons.shopping_cart) : Container(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          !isOffer
              ? Container(
                  width: dynamicWidth(context),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Text("$rating"),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: isFavored ? Colors.red : Colors.white,
                          size: 30,
                        ),
                        onPressed: onFavored,
                      )
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class MenuContainer extends StatelessWidget {
  const MenuContainer({
    super.key,
    required this.rowWidgets,
  });

  final List<Widget> rowWidgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center, children: rowWidgets),
    );
  }
}
