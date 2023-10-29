import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:waspha/src/constants/constants.dart';
import 'package:waspha/src/features/custom_need/domain/custom_need_domain.dart';
import 'package:waspha/src/widgets/nearby_store/nearby_store_widget.dart';
import 'package:waspha/src/widgets/need_login.dart';

import '../../login/domain/login_domain.dart';
import '../domain/activity_domain.dart';

final activityProvider = StateProvider<String>((ref) => "current");

class Activity extends StatefulHookConsumerWidget {
  const Activity({super.key});

  @override
  ConsumerState<Activity> createState() => _ActivityState();
}

class _ActivityState extends ConsumerState<Activity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final activity = useState("current");
    final isPast = activity.value == "past";
    final _pageController = usePageController();
    final _pageTwoController = usePageController();
    final isLogged = ref.watch(isLoggedInProvider);
    return isLogged.when(
      data: (data) {
        if (data == false) {
          return NeedLoginScreen();
        }
        return ActivityScreen(
            activity: activity,
            isPast: isPast,
            pageController: _pageController,
            pageTwoController: _pageTwoController);
      },
      error: (e, s) {
        return Text("Error");
      },
      loading: () => Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({
    super.key,
    required this.activity,
    required this.isPast,
    required PageController pageController,
    required PageController pageTwoController,
  })  : _pageController = pageController,
        _pageTwoController = pageTwoController;

  final ValueNotifier<String> activity;
  final bool isPast;
  final PageController _pageController;
  final PageController _pageTwoController;

  @override
  Widget build(BuildContext context) {
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
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Consumer(
                    builder: (context, ref, child) {
                      return Container(
                        width: 140,
                        height: 42,
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
            Padding(
                padding: const EdgeInsets.only(left: 12.0),
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

                    return Column(
                      children: [
                        Container(
                            height: 265,
                            child: ListView.builder(
                                itemCount: data?.length ?? 0,
                                controller: _pageController,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 156,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey[300]!),
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
                                                  backgroundImage:
                                                      CachedNetworkImageProvider(
                                                          data[index]
                                                                  ["category"]
                                                              ["image"]),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: ListTile(
                                                leading: Icon(Icons.schedule,
                                                    size: 17),
                                                contentPadding:
                                                    EdgeInsets.all(2),
                                                title: Text(
                                                  "56h:08m:23s",
                                                  style:
                                                      TextStyle(fontSize: 13),
                                                ),
                                              ),
                                            ),
                                            // Text(
                                            //   "56h:08m:23s",
                                            //   style: TextStyle(fontSize: 15),
                                            // ),
                                            Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Icon(
                                                  Icons.arrow_forward,
                                                  size: 17,
                                                ))
                                          ],
                                        ),
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
                        return Column(
                          children: [
                            Container(
                                height: 268,
                                child: ListView.separated(
                                    itemCount: data?.length ?? 0,
                                    controller: _pageTwoController,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: 10,
                                        ),
                                    itemBuilder: (context, index) {
                                      String rfpStatus =
                                          data[index]["rfp_status"];
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: GestureDetector(
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
      width: 312,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
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
                    Container(
                        width: 80,
                        alignment: Alignment.center,
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible: isPast,
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
                                                                    .UPCOMING
                                                                    .name
                                                                    .toLowerCase()
                                                            ? "Upcoming"
                                                            : "",
                              ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Visibility(
                                child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                          ],
                        ),
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
            Center(child: Text("Offer recieved (12)")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                      height: 50,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => SizedBox(
                                width: 2,
                              ),
                          itemBuilder: (context, index) => CircleAvatar(),
                          itemCount: 4)),
                ),
                SizedBox(
                  width: 10,
                ),
                Text("+2")
              ],
            )
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
