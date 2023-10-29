import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                        return MenuCard(
                          onFavorited: () {},
                          imageURl: data[index].image,
                          companyName: data[index].business_name["en"],
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
  });

  final String imageURl;
  final String companyName;
  final bool isOffer, isProvider;
  final double width, favWidgth;
  final void Function()? onFavorited;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: [
          Container(
            width: 311,
            height: 200,
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
                      width: MediaQuery.of(context).size.width * width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: isProvider
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))
                            : BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: !isOffer
                            ? MainAxisAlignment.spaceAround
                            : MainAxisAlignment.start,
                        children: [
                          !isOffer ? Icon(Icons.abc) : Container(),
                          Text(
                            companyName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          !isOffer ? Icon(Icons.shopping_cart) : Container(),
                        ],
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
                        child: Text('4.8'),
                      ),
                      SizedBox(
                        width: favWidgth,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
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
