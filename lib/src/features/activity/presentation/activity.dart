import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:waspha/src/constants/constants.dart';
import 'package:waspha/src/features/activity/model/order/order_model.dart';
import 'package:waspha/src/features/activity/presentation/order_card.dart';
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
                    data = data["orders"];
                    if (data == null || data?.length == 0) {
                      return Center(
                        child: Text("You don't have an order yet"),
                      );
                    }

                    final orders = List<OrderModel>.from(
                        data.map((map) => OrderModel.fromJson(map)));

                    return Column(
                      children: [
                        Container(
                          height: 230,
                          child: ListView.builder(
                            itemCount: orders.length,
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return OrderCard(order: orders[index]);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SmoothPageIndicator(
                          count: (orders.length / 2).round(),
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
                      data = data["proposals"];
                      if (data == null || data.length == 0) {
                        return Center(
                          child:
                              Text("You don't have either request/offer yet"),
                        );
                      }

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
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (rfpStatus ==
                                                  QueueStatus.REQUIRE_QUEUE.name
                                                      .toLowerCase() ||
                                              rfpStatus ==
                                                  QueueStatus.CURRENT.name
                                                      .toLowerCase()) {
                                            context.go('/activity_offers');
                                          }
                                        },
                                        child: RequestBody(
                                            isPast: isPast,
                                            proposal: data[index]),
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
    required this.proposal,
    required this.isPast,
  });

  final proposal;
  final bool isPast;

  String formatTime(String time) {
    DateTime now = DateTime.parse(time);
    DateFormat formatter = DateFormat('dd/MM/y H:mm a');
    String formatted = formatter.format(now);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    final proposalId = proposal["id"];
    final currentTime = proposal["order_date"];
    final name = proposal["category"]["name"]["en"];
    final image = proposal["category"]["image"];
    final expiredTime = proposal["expiry_time"];
    final type = proposal["type"];
    final stores = proposal["stores"];

    List<String> allClosedStatus = [
      QueueStatus.EXPIRED.name,
      QueueStatus.REJECTED.name,
      "cancelled",
    ];

    DateTime now = DateTime.now();
    bool isExpired = now.isAfter(DateTime.parse(expiredTime));
    final queueStatus =
        isExpired ? QueueStatus.EXPIRED.name : proposal["rfp_status"];

    return Container(
      width: 300,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
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
                      backgroundImage: CachedNetworkImageProvider(image ?? ""),
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
                          ],
                        ),
                        Text("Request #${proposalId}"),
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
            !allClosedStatus.contains(queueStatus) && !isExpired
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Spacer(),
                        Visibility(
                            visible: false, //TODO: This is for the divider
                            child: Center(child: Text("No more offer"))),
                        Icon(Icons.lock_clock),
                        Text(formatTime(expiredTime)),
                        Spacer()
                      ],
                    ),
                  )
                : SizedBox(height: 30),
            Center(
                child: Text(stores.length > 0
                    ? "Offer received (${stores.length})"
                    : "No offer received")),
            stores.length > 0
                ? Row(
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
                                itemBuilder: (context, index) => CircleAvatar(
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                              stores[index]["image"] ?? ""),
                                    ),
                                itemCount:
                                    stores.length > 5 ? 5 : stores.length)),
                      ),
                      stores.length > 5
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text("+2"),
                            )
                          : Container()
                    ],
                  )
                : Container()
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
