// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/widgets/nearby_store/nearby_store_widget.dart';
import 'package:waspha/src/widgets/search/search_widget.dart';

import '../../../constants/constants.dart';
import '../../../widgets/categories/categories_widget.dart';
import '../../../widgets/need_login.dart';
import '../../login/domain/login_domain.dart';
import '../../menu/menu_detail/presentation/menu_detail.dart';
import '../../nearby_stores/domain/stores_repository.dart';
import '../data/item_data.dart';
import '../domain/custom_need_domain.dart';
import 'item_widget.dart';
import 'select_date.dart';

final itemsProvider = StateProvider<List<Item>>((ref) => []);

class CustomNeedScreen extends StatefulHookConsumerWidget {
  final isMenu;

  CustomNeedScreen({super.key, required this.isMenu});

  @override
  ConsumerState<CustomNeedScreen> createState() => _CustomNeedScreenState();
}

class _CustomNeedScreenState extends ConsumerState<CustomNeedScreen> {
  @override
  Widget build(BuildContext context) {
    final isScheduled = useState(false);
    final isLogged = ref.watch(isLoggedInProvider);
    return isLogged.when(data: (data) {
      if (data == false) {
        return NeedLoginScreen();
      }

      return Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomBackButton(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Consumer(
                    builder: (context, ref, child) {
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
                    },
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final method = ref.watch(methodProvider);
                    final subCategory = ref.watch(subCategoryProvider);
                    final category = ref.watch(categoryProvider);

                    return RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "${capitalize(method)} direct request \n",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "${category["name"]}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      WidgetSpan(child: Icon(Icons.arrow_forward)),
                      TextSpan(
                          text: "${subCategory["name"]} \n",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ]));
                  },
                ),
              ],
            ),
            Container(
              width: 370,
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 1,
                    ),
                    Text(
                      "Craft your request",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Spacer(),
                    Visibility(
                      visible: widget.isMenu,
                      child: Consumer(builder: (context, ref, child) {
                        final storeID = ref.watch(storeIDProvider);
                        print("ID: $storeID");
                        return GestureDetector(
                          onTap: () {
                            context.push('/menu-offer', extra: storeID);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/nearby/menu.png'),
                              Text("Menu")
                            ],
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Consumer(builder: (context, ref, child) {
                      final items = ref.watch(itemsProvider);
                      return GestureDetector(
                        onTap: () {
                          items.insert(0, new Item(deleteCallback: (item) {
                            items.remove(item);
                            ref.invalidate(itemsProvider);
                          }));
                          setState(() {});
                          print(items);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/nearby/menu.png'),
                            Text("new")
                          ],
                        ),
                      );
                    }),
                    SizedBox(
                      width: 1,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer(builder: (context, ref, child) {
              final items = ref.watch(itemsProvider);

              return Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5,
                  ),
                  itemBuilder: (context, index) => CreateItemWidget(
                    item: items[index],
                  ),
                ),
              );
            }),
            SizedBox(
              height: 20,
            ),
            Consumer(builder: (context, ref, child) {
              final items = ref.watch(itemsProvider);

              return ReadyRequestButton(items: items, isScheduled: isScheduled);
            }),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ));
    }, error: (e, s) {
      return Text("Error");
    }, loading: () {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    });
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.backgroundColor = Colors.black,
    this.foregroundColor = Colors.white,
  });

  final Color backgroundColor, foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          width: 42,
          height: 42,
          child: IconButton(
              iconSize: 18,
              padding: EdgeInsets.zero,
              onPressed: () => context.pop(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: foregroundColor,
              )),
        ));
  }
}

class ReadyRequestButton extends StatelessWidget {
  const ReadyRequestButton({
    super.key,
    required this.items,
    required this.isScheduled,
  });

  final List<Item> items;
  final ValueNotifier<bool> isScheduled;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => GestureDetector(
        onTap: () {
          if (items.length == 0) {
            return;
          }
          showDialog(
              context: context,
              builder: (context) {
                final method = ref.watch(methodProvider);

                final itemsJsonList =
                    items.map((item) => item.toJson()).toList();
                final currentPlace = ref.watch(currentPlaceDescription);

                return Dialog(
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Confirmation",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              CustomCloseButton()
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Items (${items.length})",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                "${items[index].quantity} x ${items[index].name}"),
                            itemCount: items.length,
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${capitalize(method)} instruction",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                  "https://images.unsplash.com/photo-1485965120184-e220f721d03e?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                            ),
                            title: Text("${capitalize(method)}"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 7.5),
                            child: Icon(Icons.arrow_downward),
                          ),
                          Consumer(builder: (context, ref, child) {
                            final userProfile =
                                ref.watch(getUserAvatarProvider);
                            return userProfile.when(
                                data: (image) {
                                  return ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          CachedNetworkImageProvider(image ??
                                              "https://static.vecteezy.com/system/resources/previews/009/292/244/non_2x/default-avatar-icon-of-social-media-user-vector.jpg"),
                                    ),
                                    title: Text("${currentPlace}"),
                                  );
                                },
                                error: (e, s) {
                                  print("LOG CUSTOM : $e");
                                  return Text("Error");
                                },
                                loading: () => Container());
                          }),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              child: Icon(Icons.lock_clock_rounded),
                            ),
                            title: Text(isScheduled.value
                                ? "Scheduled"
                                : "Delivery Now"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(13)))),
                                  onPressed: () {
                                    ref.watch(createRFPProvider(
                                        items: itemsJsonList,
                                        context: context));
                                    context.push('/buffer_brand');
                                  },
                                  child: Text(
                                    "Confirm my request",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          )
                        ]),
                  ),
                );
              });
          // final itemsJsonList =
          //     items.value.map((item) => item.toJson()).toList();
          // print(itemsJsonList);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Color(0xff663399),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: isScheduled.value ? 3 : 6,
                        child: SizedBox(
                          width: isScheduled.value ? 80 : 150,
                          child: Center(
                            child: Text(
                              isScheduled.value
                                  ? 'Schedule'
                                  : 'Ready for request',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: isScheduled.value ? 6 : 3,
                      child: Consumer(
                        builder: (context, ref, child) => Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButton(
                                  isExpanded: true,
                                  underline: Container(),
                                  dropdownColor: Colors.grey[200],
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  value: isScheduled.value
                                      ? ref.watch(selectedTimeProvider)
                                      : "Now",
                                  hint: Text("df"),
                                  items: [
                                    DropdownMenuItem(
                                      value: "Now",
                                      child: Center(child: Text("Now")),
                                    ),
                                    DropdownMenuItem(
                                      value: isScheduled.value
                                          ? ref.watch(selectedTimeProvider)
                                          : "Scheduled",
                                      child: Center(
                                        child: Text(
                                          isScheduled.value
                                              ? ref.watch(selectedTimeProvider)
                                              : 'Scheduled',
                                        ),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    if (value == "Scheduled") {
                                      isScheduled.value = true;
                                      context.push('/select_date');
                                    } else {
                                      isScheduled.value = false;
                                    }
                                  }),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.black,
      child: IconButton(
          padding: EdgeInsets.zero,
          color: Colors.white,
          onPressed: () => context.pop(),
          icon: Icon(Icons.close)),
    );
  }
}
