import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
                SizedBox(
                  height: 20,
                ),
                MenuContainer(
                  rowWidgets: [
                    Icon(Icons.search),
                    Center(child: Text("Find Provider / Products")),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: ListView.separated(
                      itemCount: data.length,
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => context.push('/menu-detail',
                              extra: data[index].id),
                          child: Consumer(builder: (context, ref, child) {
                            return MenuCard(
                              rating: data[index].average_rating,
                              onFavorited: () async {
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
                              isFavorited: data[index].is_favorite ?? false,
                              imageURl: data[index].image,
                              companyName: data[index].business_name["en"],
                            );
                          }),
                        );
                      }),
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
    required this.onFavorited,
    this.favWidgth = 250,
    this.isProvider = false,
    this.isFavorited = false,
    this.rating = 0,
  });

  final String imageURl;
  final String companyName;
  final bool isOffer, isProvider;
  final double width, favWidgth;
  final void Function()? onFavorited;
  final bool isFavorited;
  final double rating;

  double dynamicWidth() {
    if (isOffer) {
      return 150;
    } else if (isProvider) {
      return 311;
    }
    return 370;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: [
          Container(
            width: dynamicWidth(),
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
                      width: dynamicWidth(),
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
                            FittedBox(
                              child: Text(
                                companyName,
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
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Text("$rating"),
                      ),
                      SizedBox(
                        width: favWidgth,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorited ? Colors.red : Colors.white,
                          size: 30,
                        ),
                        onPressed: onFavorited,
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
