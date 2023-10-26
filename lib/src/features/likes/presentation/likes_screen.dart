import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/nearby_store/nearby_store_widget.dart';
import '../../login/domain/login_domain.dart';
import '../../menu/presentation/menu.dart';
import '../../nearby_stores/presentation/nearby_stores.dart';
import '../domain/likes_domain.dart';

class LikesScreen extends ConsumerStatefulWidget {
  const LikesScreen({super.key});

  @override
  ConsumerState<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends ConsumerState<LikesScreen> {
  isLogged() {
    return ref.read(isLoggedInProvider.future).then((value) {
      if (value == false) {
        return showAdaptiveDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return CustomDialog(
                isLogged: true,
                content: "Please login to see your credit cards",
              );
            });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isLogged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ProfileAppBar(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Likes",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 348,
                  height: 323,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Address you like",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            final locations = ref.watch(getLocationsProvider);
                            return locations.when(data: (data) {
                              return Container(
                                height: 200,
                                child: ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: ((context, index) {
                                    return ListTile(
                                      onTap: () => context.pushNamed(
                                          "EditLocation",
                                          pathParameters: {
                                            "title": data[index].title,
                                            "address": data[index].address,
                                            "landmark": data[index].landmark,
                                            "phone": data[index].phone
                                          }),
                                      leading: Icon(Icons.location_on),
                                      title: Text(data[index].title),
                                      trailing: Icon(Icons.arrow_forward),
                                    );
                                  }),
                                ),
                              );
                            }, error: (e, s) {
                              print("Location Error $e");
                              return Text("Error");
                            }, loading: () {
                              return Center(child: CircularProgressIndicator());
                            });
                          },
                        ),
                        Center(
                          child: ListTile(
                            onTap: () => context.push('/add_address'),
                            leading: Icon(Icons.add),
                            title: Text(
                              "Add new address",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 348,
                  height: 291,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 1)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Providers you like",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.info)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 400,
                          height: 200,
                          child: ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => SizedBox(
                                    width: 15,
                                  ),
                              itemBuilder: (context, index) {
                                return MenuCard(
                                  imageURl: '',
                                  companyName: "",
                                  onFavorited: () {},
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
