import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/widgets/nearby_store/domain/nearby_domain.dart';

import '../../../widgets/nearby_store/nearby_store_widget.dart';
import '../../../widgets/need_login.dart';
import '../../login/domain/login_domain.dart';
import '../../menu/presentation/menu.dart';
import '../domain/likes_domain.dart';

class LikesScreen extends ConsumerStatefulWidget {
  const LikesScreen({super.key});

  @override
  ConsumerState<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends ConsumerState<LikesScreen> {
  @override
  Widget build(BuildContext context) {
    final isLogged = ref.watch(isLoggedInProvider);
    return isLogged.when(data: (data) {
      if (data == false) {
        return NeedLoginScreen();
      }
      return LikesBody();
    }, error: (e, s) {
      return Text("Error");
    }, loading: () {
      return Center(child: CircularProgressIndicator());
    });
  }
}

class LikesBody extends StatelessWidget {
  const LikesBody({
    super.key,
  });

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
                width: MediaQuery.of(context).size.width * 0.9,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                            return data.isEmpty
                                ? Center(
                                    child: Text("No address found"),
                                  )
                                : Container(
                                    height: 150,
                                    child: ListView.builder(
                                      itemCount: data.length,
                                      shrinkWrap: true,
                                      itemBuilder: ((context, index) {
                                        return Dismissible(
                                          key: UniqueKey(),
                                          onDismissed: (direction) {
                                            print(data[index]);
                                            ref.read(deleteLocationProvider(
                                                id: data[index].id));
                                            data.removeAt(index);
                                          },
                                          child: ListTile(
                                            onTap: () => context.pushNamed(
                                              "EditLocation",
                                              extra: data[index],
                                            ),
                                            leading: Icon(Icons.location_on),
                                            title: Text(data[index].title),
                                            trailing: Icon(Icons.arrow_forward),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                          }, error: (e, s) {
                            print("Location Error $e $s");
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
                width: MediaQuery.of(context).size.width * 0.9,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Text(
                              "Providers you like",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Icon(Icons.info)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Consumer(builder: (context, ref, child) {
                        final favStores = ref.watch(getFavStoresProvider);
                        return favStores.when(
                            data: (data) {
                              return data.isEmpty
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Center(
                                        child: Text("No providers found"),
                                      ),
                                    )
                                  : Center(
                                      child: Container(
                                        width: 400,
                                        height: 200,
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          itemCount: data.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return MenuCard(
                                              imageURl: data[index]["store"]
                                                      ["image"] ??
                                                  "",
                                              companyName: data[index]["store"]
                                                  ["business_name"]["en"],
                                              width: 0.8,
                                              favWidth: 200,
                                              isProvider: true,
                                              onFavored: () async {
                                                ref.read(deleteStoreFavProvider(
                                                    id: data[index]["store"]
                                                        ["id"]));
                                                ref.invalidate(
                                                    getFavStoresProvider);
                                              },
                                              isFavored: true,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                            },
                            error: (e, s) {
                              return Text("Error");
                            },
                            loading: () => CircularProgressIndicator());
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
