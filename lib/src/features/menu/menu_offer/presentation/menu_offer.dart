import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/menu/presentation/menu.dart';

import '../../../../widgets/categories/categories_widget.dart';
import '../../../../widgets/nearby_store/nearby_store_widget.dart';
import '../domain/menu_offer_domain.dart';

class MenuOffer extends HookWidget {
  final id;
  const MenuOffer({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final categoryID = useState<int>(0);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [BackButton(), Icon(Icons.shopping_cart)],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
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
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Menu \n",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "Noon Express ..",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ])),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Find products",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_alt_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Offers"), Text("See all(45)")],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                  width: 1,
                ),
                itemBuilder: (context, index) {
                  return MenuCard(
                      isOffer: true,
                      width: 0.8,
                      onFavorited: () {},
                      imageURl:
                          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
                      companyName: "Buy and Get Free");
                },
                itemCount: 10,
              )),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Trending Products"), Text("See all(45)")],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                  width: 1,
                ),
                itemBuilder: (context, index) {
                  return MenuCard(
                      isOffer: true,
                      width: 0.8,
                      onFavorited: () {},
                      imageURl:
                          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
                      companyName: "Shampoo +");
                },
                itemCount: 10,
              )),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Categories"), Text("See all(45)")],
            ),
          ),
          Consumer(builder: (context, ref, child) {
            print("CAT ID: $id");
            final categories = ref.watch(getStoresCategoriesProvider(id));
            return categories.when(
                data: (data) => Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 1,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            categoryID.value = data[index]["id"];
                          },
                          child: MenuCard(
                              isOffer: true,
                              width: 0.4,
                              onFavorited: () {},
                              imageURl: data[index]["image"]["en"],
                              companyName: data[index]["name"]["en"]),
                        );
                      },
                      itemCount: data.length,
                    )),
                error: (e, s) => Text("Error Happened"),
                loading: () => CircularProgressIndicator());
          }),
          SizedBox(
            height: 40,
          ),
          Visibility(
            visible: categoryID.value != 0,
            child: Consumer(builder: (context, ref, child) {
              final categories = ref.watch(getStoresProductsProvider(
                  storeID: id, categoryID: categoryID.value));
              return categories.when(
                  data: (data) => Container(
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: GestureDetector(
                                onTap: () => context.push('/product_details',
                                    extra: data?[index]["id"]),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
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
                                            Text(data[index]["description"]
                                                    ["en"]
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
                  loading: () => CircularProgressIndicator());
            }),
          ),
          SizedBox(
            height: 40,
          ),
        ]),
      )),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
        ));
  }
}
