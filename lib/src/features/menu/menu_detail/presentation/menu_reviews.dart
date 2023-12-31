import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/widgets/custom_back_button/custom_back_button.dart';

import '../../../reviews/presentation/reviews.dart';
import '../domain/menu_detail.dart';

class MenuReviews extends StatelessWidget {
  final id;
  const MenuReviews({super.key, required this.id});

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
                final reviews = ref.watch(getStoreReviewsProvider(id: id));
                return reviews.when(data: (data) {
                  return Expanded(
                      child: ListView.separated(
                          itemCount: data["reviews_ratings"].length,
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                          itemBuilder: (context, index) {
                            return ReviewWidget(
                                userName: data["reviews_ratings"][index]["user"]
                                    ["name"],
                                userAvatar: data["reviews_ratings"][index]
                                        ["user"]["avatar"] ??
                                    "");
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
