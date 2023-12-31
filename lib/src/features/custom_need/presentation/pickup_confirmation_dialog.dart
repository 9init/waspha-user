import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/widgets/custom_close_button/custom_close_button.dart';

import '../../../constants/constants.dart';
import '../../login/domain/login_domain.dart';
import '../../nearby_stores/domain/stores_repository.dart';
import '../data/item_data.dart';
import '../domain/custom_need_domain.dart';
import 'select_date.dart';

class PickupConfirmationDialog extends StatelessWidget {
  const PickupConfirmationDialog({
    super.key,
    required this.consumer,
    required this.items,
    required this.method,
    required this.currentPlace,
    required this.isScheduled,
    required this.itemsJsonList,
  });

  final WidgetRef consumer;
  final List<Item> items;
  final String method;
  final String currentPlace;
  final ValueNotifier<bool> isScheduled;
  final List<Map<String, dynamic>> itemsJsonList;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> stores = consumer.read(getStoresProvider);

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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
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
                      "https://images.unsplash.com/photo-1596887772390-2648c0155278?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                ),
                title: Text("${capitalize(method)}"),
              ),
              Consumer(builder: (context, ref, child) {
                final userProfile = ref.watch(getUserAvatarProvider);
                return userProfile.when(
                    data: (image) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(image ??
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
              Padding(
                padding: const EdgeInsets.only(left: 7.5),
                child: Icon(Icons.arrow_downward),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  children: [
                    Container(
                      height: 38,
                      child: ListView.builder(
                          itemCount: stores.length > 5 ? 5 : stores.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return AnimatedAlign(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                              alignment: Alignment.centerLeft,
                              widthFactor: 0.6,
                              child: CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                    stores[index].image),
                              ),
                            );
                          }),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: stores.length == 5 ? 0 : 30),
                        child: Text(
                          stores.length > 5
                              ? "+${stores.length - 5}"
                              : stores.length == 1
                                  ? stores[0].address
                                  : "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  child: Icon(Icons.access_time_filled),
                ),
                title: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: RichText(
                      text: TextSpan(
                        text: isScheduled.value
                            ? "Pick up on "
                            : "Pickup ", // Common text
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: isScheduled.value
                                ? consumer.watch(selectedTimeProvider)
                                : "Now",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )),
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
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(13)))),
                      onPressed: () {
                        consumer
                            .read(createRFPProvider(items: itemsJsonList, context: context)
                                .future)
                            .then((value) =>
                                context.push('/buffer_brand', extra: value));
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
  }
}
