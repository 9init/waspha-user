import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:waspha/src/features/notification/domain/notification_domain.dart';

import '../../custom_need/presentation/custom_need.dart';

class NotificationsScreen extends HookWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isCollapsed = useState(true);
    final collapsedString = useState<String>("..More");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomCloseButton(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Notifications",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Consumer(
              builder: (context, ref, child) {
                final notifications =
                    ref.watch(getNotificationProvider(context));
                return notifications.when(
                    data: (data) {
                      return Expanded(
                        child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 20,
                                ),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return NotificationCard(
                                isCollapsed: isCollapsed,
                                textBody: data[index]["body"],
                                avatarImage: data[index]["extra_data"]
                                    ["sent_by"]["avatar"],
                                collapsedString: collapsedString,
                              );
                            }),
                      );
                    },
                    error: (e, s) {
                      return Text("Error");
                    },
                    loading: () => CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key,
      required this.isCollapsed,
      required this.collapsedString,
      required this.textBody,
      required this.avatarImage});

  final ValueNotifier<bool> isCollapsed;
  final ValueNotifier<String> collapsedString;
  final String avatarImage, textBody;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {},
      background: Container(
        color: Colors.red,
      ),
      child: Container(
        width: 348,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Text("5 min ago"),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(avatarImage),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ReadMoreText(
                        textBody,
                        trimLines: 2,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        lessStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        moreStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Expanded(
                    //   child: ReadMoreText(
                    //     'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                    //     trimLines: 2,
                    //     callback: (value) {
                    //       isCollapsed.value = value;
                    //     },
                    //     colorClickableText: Colors.pink,
                    //     trimMode: TrimMode.Line,
                    //     trimCollapsedText: 'Show more',
                    //     trimExpandedText: 'Show less',
                    //     lessStyle: TextStyle(
                    //         fontSize: 14, fontWeight: FontWeight.bold),
                    //     moreStyle: TextStyle(
                    //         fontSize: 14, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
