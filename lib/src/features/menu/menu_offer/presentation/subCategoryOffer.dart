import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/custom_need/presentation/custom_need.dart';

import '../domain/menu_offer_domain.dart';

class SubCategoryOffer extends HookWidget {
  final data;
  const SubCategoryOffer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(data?["image"]),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        data?["name"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackButton(),
                      GestureDetector(
                        onTap: () {
                          context.push('/custom_need_screen', extra: true);
                        },
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: Stack(
                            children: [
                              Icon(Icons.shopping_bag, size: 40),
                              Positioned(
                                top: 25,
                                left: 20,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child:
                                      Consumer(builder: (context, ref, child) {
                                    final items = ref.watch(itemsProvider);
                                    return CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.black,
                                      child: Text("${items.length}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Find products",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child:
                        Transform.rotate(angle: 190.1, child: Icon(Icons.tune)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
            child: Text("Related Products",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Consumer(builder: (context, ref, child) {
            final categories =
                ref.watch(getStoresProductsProvider(categoryID: data["id"]));

            return categories.when(
                data: (data) => Container(
                      height: 350,
                      child: ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () =>
                                  context.push('/product_details', extra: {
                                "id": data[index]["id"],
                                "title": data?[index]["title"]["en"],
                                "description": data?[index]["description"]
                                    ["en"],
                                "image": data?[index]["image"]["en"],
                              }),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 33,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          data[index]["image"]["en"],
                                          errorListener: (_) =>
                                              Icon(Icons.broken_image),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(data[index]["title"]["en"]
                                              .toString()),
                                          Text(data[index]["description"]["en"]
                                              .toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: data.length,
                      ),
                    ),
                error: (e, s) => Text("Error Happened"),
                loading: () => Center(child: CircularProgressIndicator()));
          }),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () => context.go('/custom_need_screen', extra: true),
            child: Center(
              child: Container(
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xff663399),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text("View my request",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
