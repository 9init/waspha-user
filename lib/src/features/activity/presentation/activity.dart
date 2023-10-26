import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:waspha/src/constants/constants.dart';
import 'package:waspha/src/features/custom_need/domain/custom_need_domain.dart';
import 'package:waspha/src/widgets/nearby_store/nearby_store_widget.dart';

import '../../login/domain/login_domain.dart';
import '../../nearby_stores/presentation/nearby_stores.dart';
import '../domain/activity_domain.dart';

final activityProvider = StateProvider<String>((ref) => "current");

class Activity extends StatefulHookConsumerWidget {
  const Activity({super.key});

  @override
  ConsumerState<Activity> createState() => _ActivityState();
}

class _ActivityState extends ConsumerState<Activity> {
  isLogged() async {
    return ref.read(isLoggedInProvider.future).then((value) {
      if (value == false) {
        return showAdaptiveDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return CustomDialog(
                isLogged: true,
                content: "Please login to see your activities",
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
    final activity = useState("current");
    final isPast = activity.value == "past";
    final _pageController = usePageController();
    final _pageTwoController = usePageController();

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ProfileAppBar(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Activities',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Consumer(
                    builder: (context, ref, child) {
                      return Container(
                        width: 140,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50)),
                        child: DropdownButton(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          underline: SizedBox(),
                          value: activity.value,
                          alignment: Alignment.center,
                          style:
                              TextStyle(color: Color(0xFFFFFFFF), fontSize: 19),
                          dropdownColor: Colors.black,
                          icon: Icon(Icons.arrow_drop_down,
                              color: Color(0xFFFFFFFF)),
                          items: [
                            DropdownMenuItem(
                              child: Text("Current"),
                              value: "current",
                            ),
                            DropdownMenuItem(
                              child: Text("Past"),
                              value: "past",
                            ),
                            DropdownMenuItem(
                              child: Text("Upcoming"),
                              value: "upcoming",
                            ),
                          ],
                          onChanged: (v) {
                            activity.value = v!;
                            ref
                                .watch(activityProvider.notifier)
                                .update((state) => v);
                            ref.refresh(getRFPListingProvider(context)).value;
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(isPast ? "Last Orders" : "Order Progress",
                    style: TextStyle(
                      fontSize: 20,
                    ))),
            SizedBox(
              height: 10,
            ),
            Consumer(builder: (context, ref, child) {
              final rfpList = ref.watch(getRFPListingProvider(context));
              return rfpList.when(
                  data: (data) {
                    if (data == null || data?.length == 0) {
                      return Center(
                        child: Text("You don't have an order yet"),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                              height: 270,
                              child: ListView.separated(
                                  itemCount: data?.length ?? 0,
                                  controller: _pageController,
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                        width: 20,
                                      ),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 180,
                                      height: 260,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey[300]!,
                                                blurRadius: 5,
                                                offset: Offset(0, 1))
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage:
                                                      CachedNetworkImageProvider(
                                                          'https://cdn.shopify.com/s/files/1/0584/4425/1314/products/IMG_8760_800x.jpg'),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  capitalize(
                                                    data[index]["type"],
                                                  ),
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text("Order #120",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                )),
                                            Text("cash on delivery"),
                                            Text(
                                              "In Pickup",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("5/5/5"),
                                                    Text("5:00 PM"),
                                                  ],
                                                ),
                                                CircleAvatar(
                                                  radius: 25,
                                                  backgroundImage:
                                                      CachedNetworkImageProvider(
                                                          data[index]
                                                                  ["category"]
                                                              ["image"]),
                                                ),
                                              ],
                                            ),
                                            ListTile(
                                              leading: Icon(
                                                Icons.schedule,
                                              ),
                                              title: FittedBox(
                                                  child: Text("56h:08m:23s")),
                                            ),
                                            // Text(
                                            //   "56h:08m:23s",
                                            //   style: TextStyle(fontSize: 15),
                                            // ),
                                            Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child:
                                                    Icon(Icons.arrow_forward))
                                          ],
                                        ),
                                      ),
                                    );
                                  })),
                          SizedBox(
                            height: 10,
                          ),
                          SmoothPageIndicator(
                            count: (data.length / 2).round(),
                            controller: _pageController,
                            effect: ExpandingDotsEffect(
                              dotWidth: 7,
                              dotHeight: 7,
                              activeDotColor: Colors.purple,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  error: (e, s) {
                    return Text("Error");
                  },
                  loading: () => Center(child: CircularProgressIndicator()));
            }),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                    isPast
                        ? "Last requests and offers"
                        : "My requests and offers",
                    style: TextStyle(
                      fontSize: 20,
                    ))),
            SizedBox(
              height: 10,
            ),
            Consumer(
              builder: (context, ref, child) {
                final rfpList = ref.watch(getRFPListingProvider(context));
                return rfpList.when(
                    data: (data) {
                      if (data == null || data?.length == 0) {
                        return Center(
                          child:
                              Text("You don't have either request/offer yet"),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                  height: 250,
                                  child: ListView.separated(
                                      itemCount: data?.length ?? 0,
                                      controller: _pageTwoController,
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            width: 20,
                                          ),
                                      itemBuilder: (context, index) {
                                        String rfpStatus =
                                            data[index]["rfp_status"];
                                        return GestureDetector(
                                          onTap: () {
                                            if (rfpStatus ==
                                                    QueueStatus
                                                        .REQUIRE_QUEUE.name
                                                        .toLowerCase() ||
                                                rfpStatus ==
                                                    QueueStatus.CURRENT.name
                                                        .toLowerCase()) {
                                              context.go('/activity_offers');
                                            }
                                          },
                                          child: RequestBody(
                                            isPast: isPast,
                                            expiredTime: data[index]
                                                ["expiry_time"],
                                            currentTime: data[index]
                                                ["order_date"],
                                            queueStatus: rfpStatus,
                                            image: data[index]["category"]
                                                ["image"],
                                            name: data[index]["category"]
                                                ["name"]["en"],
                                            type: data[index]["type"],
                                          ),
                                        );
                                      })),
                              SizedBox(
                                height: 10,
                              ),
                              SmoothPageIndicator(
                                count: (data?.length - 1.5).round(),
                                controller: _pageTwoController,
                                effect: ExpandingDotsEffect(
                                  dotWidth: 8,
                                  dotHeight: 8,
                                  activeDotColor: Colors.purple,
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    },
                    error: (e, s) {
                      return Text("Error happened");
                    },
                    loading: () => Center(child: CircularProgressIndicator()));
              },
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class RequestBody extends StatelessWidget {
  const RequestBody({
    super.key,
    required this.isPast,
    required this.image,
    required this.name,
    required this.type,
    this.queueStatus = "closed",
    required this.currentTime,
    required this.expiredTime,
  });

  final bool isPast;
  final String image, name, type, queueStatus, currentTime, expiredTime;

  String formatTime(String time) {
    DateTime now = DateTime.parse(currentTime);
    DateFormat formatter = DateFormat('dd/MM/y H:mm a');
    String formatted = formatter.format(now);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    bool isExpired = now.isAfter(DateTime.parse(expiredTime));
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey[300]!, blurRadius: 5, offset: Offset(0, 1))
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: CachedNetworkImageProvider(image),
                    ),
                    Text(name),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Visibility(
                          visible: isPast,
                          child: Center(
                            child: ClosedText(
                              text: queueStatus ==
                                      QueueStatus.QUEUE_STOPPED.name
                                          .toLowerCase()
                                  ? "Stopped"
                                  : queueStatus ==
                                              QueueStatus.EXPIRED.name
                                                  .toLowerCase() ||
                                          isExpired
                                      ? "Expired"
                                      : queueStatus ==
                                              QueueStatus.REJECTED.name
                                                  .toLowerCase()
                                          ? "Rejected"
                                          : queueStatus ==
                                                  QueueStatus.CANCELLED.name
                                                      .toLowerCase()
                                              ? "Cancelled"
                                              : queueStatus ==
                                                      QueueStatus
                                                          .REQUIRE_QUEUE.name
                                                          .toLowerCase()
                                                  ? "Require Queue"
                                                  : queueStatus ==
                                                          QueueStatus
                                                              .CURRENT.name
                                                              .toLowerCase()
                                                      ? "Current"
                                                      : queueStatus ==
                                                              QueueStatus
                                                                  .UPCOMING.name
                                                                  .toLowerCase()
                                                          ? "Upcoming"
                                                          : "",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        Visibility(
                          visible: isPast,
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Request #120"),
                        Text(formatTime(currentTime)),
                        Text(capitalize(type),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Visibility(visible: !isExpired, child: Text("Now")),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Visibility(
                visible: false, //TODO: This is for the divider
                child: Center(child: Text("No more offer"))),
            ListTile(
              leading: Icon(Icons.lock_clock),
              title: Text("56h:08m:23s"),
            ),
            Text("Offer recieved (12)"),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CircleAvatar(),
                    itemCount: 4))
          ],
        ),
      ),
    );
  }
}

class ClosedText extends StatelessWidget {
  const ClosedText({
    super.key,
    this.text = "Closed",
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    );
  }
}
