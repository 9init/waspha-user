import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:waspha/src/features/custom_need/presentation/custom_need.dart';

import '../domain/reviews_domain.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CustomBackButton(),
                )),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Reviews",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Consumer(
              builder: (context, ref, child) {
                final reviews = ref.watch(getUserReviewsProvider);
                return reviews.when(data: (data) {
                  return Expanded(
                      child: ListView.separated(
                          itemCount: data.length,
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemBuilder: (context, index) {
                            return ReviewWidget(
                              userName: data?[index]["reviewed_by"]["name"],
                              userAvatar: data?[index]["reviewed_by"]["image"],
                            );
                          }));
                }, error: (e, s) {
                  return Center(child: Text("No reviews yet"));
                }, loading: () {
                  return Center(child: CircularProgressIndicator());
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.userName,
    required this.userAvatar,
  });

  final String? userName, userAvatar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Transform.translate(
              offset: Offset(0, -30),
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(userAvatar ??
                    "https://st3.depositphotos.com/9998432/13335/v/450/depositphotos_133352156-stock-illustration-default-placeholder-profile-icon.jpg"),
              )),
          title: Text(userName ?? ""),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("5 days ago", style: TextStyle(color: Colors.grey)),
              Row(
                children: [
                  Icon(Icons.star, color: Color(0xFFFFB900), size: 17),
                  Icon(Icons.star, color: Color(0xFFFFB900), size: 17),
                  Icon(Icons.star, color: Color(0xFFFFB900), size: 17),
                  Icon(Icons.star, color: Color(0xFFFFB900), size: 17),
                  Icon(Icons.star, color: Colors.grey, size: 17),
                ],
              ),
              ReadMoreText(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporaliqua",
                trimLines: 2,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Divider(),
        )
      ],
    );
  }
}
