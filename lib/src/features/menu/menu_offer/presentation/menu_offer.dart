import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/custom_need/presentation/custom_need.dart';
import 'package:waspha/src/features/menu/presentation/menu.dart';

import '../../../../widgets/categories/categories_widget.dart';
import '../../../../widgets/nearby_store/nearby_store_widget.dart';
import '../domain/menu_offer_domain.dart';

class MenuOffer extends HookWidget {
  final id;
  const MenuOffer({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBackButton(),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    context.push('/custom_need_screen', extra: true);
                  },
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Stack(
                      children: [
                        Icon(Icons.shopping_bag, size: 40),
                        Positioned(
                          top: 25,
                          left: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Consumer(builder: (context, ref, child) {
                              final items = ref.watch(itemsProvider);
                              return CircleAvatar(
                                radius: 10,
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 60,
                child: Consumer(builder: (context, ref, child) {
                  final subCategory = ref.watch(subCategoryProvider);
                  final category = ref.watch(categoryProvider);

                  return Stack(
                    children: [
                      Positioned(
                        left: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              '${category["image"]}'),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              '${subCategory["image"]}'),
                        ),
                      )
                    ],
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Consumer(builder: (context, ref, child) {
                  final subCategory = ref.watch(subCategoryProvider);
                  final category = ref.watch(categoryProvider);
                  return RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "${category["name"]} \n",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "${subCategory["name"]}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ]));
                }),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 15),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Find products",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [Text("Offers"), Text("See all(45)")],
          //   ),
          // ),
          // Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: 200,
          //     child: ListView.separated(
          //       scrollDirection: Axis.horizontal,
          //       separatorBuilder: (context, index) => SizedBox(
          //         width: 1,
          //       ),
          //       itemBuilder: (context, index) {
          //         return MenuCard(
          //             isOffer: true,
          //             width: 0.8,
          //             onFavored: () {},
          //             imageURl:
          //                 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
          //             companyName: "Buy and Get Free");
          //       },
          //       itemCount: 10,
          //     )),
          // SizedBox(
          //   height: 40,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [Text("Trending Products"), Text("See all(45)")],
          //   ),
          // ),
          // Container(
          //     width: MediaQuery.of(context).size.width,
          //     height: 200,
          //     child: ListView.separated(
          //       scrollDirection: Axis.horizontal,
          //       separatorBuilder: (context, index) => SizedBox(
          //         width: 1,
          //       ),
          //       itemBuilder: (context, index) {
          //         return MenuCard(
          //             isOffer: true,
          //             width: 0.8,
          //             onFavored: () {},
          //             imageURl:
          //                 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
          //             companyName: "Shampoo +");
          //       },
          //       itemCount: 10,
          //     )),
          // SizedBox(
          //   height: 40,
          // ),
          Consumer(builder: (context, ref, child) {
            final categories = ref.watch(getStoresCategoriesProvider(id));

            return categories.when(data: (data) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("See all(${data.length})")
                  ],
                ),
              );
            }, error: (e, s) {
              return Text("Error Happened");
            }, loading: () {
              return Container();
            });
          }),
          Consumer(builder: (context, ref, child) {
            final categories = ref.watch(getStoresCategoriesProvider(id));

            return categories.when(
                data: (data) {
                  return Container(
                      height: 200,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 1,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () =>
                                context.push('/subcategory_offer', extra: {
                              "id": data[index]["id"],
                              "name": data[index]["name"]["en"],
                              "image": data[index]["image"]["en"]
                            }),
                            child: MenuCard(
                                isOffer: true,
                                width: 0.7,
                                onFavored: () {},
                                imageURl: data[index]["image"]["en"],
                                companyName: data[index]["name"]["en"]),
                          );
                        },
                        itemCount: data.length,
                      ));
                },
                error: (e, s) => Text("Error Happened"),
                loading: () => CircularProgressIndicator());
          }),

          SizedBox(
            height: 40,
          ),
        ]),
      )),
    );
  }
}
