import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waspha/core/const/dimension/dimensions.dart';
import 'package:waspha/src/features/activity/presentation/activity.dart';
import 'package:gap/gap.dart';

class ActivityOffers extends StatelessWidget {
  const ActivityOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          NetworkImage('https://picsum.photos/250?image=9'),
                    ),
                    Text("SeaFood")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Request #128",
                              style: TextStyle(color: Colors.white)),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    ClosedText()
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Divider(),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Offer #1 from 5"),
                  RatingsWidget(),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => OfferBody(),
              ),
            )
          ],
        ));
  }

  Padding OfferBody() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [
          Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey[300]!, blurRadius: 5, offset: Offset(0, 1))
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Active - New",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text("2 Min ago")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 40,
                    ),
                    Column(
                      children: [
                        Text("noon express down \n town Alexandria"),
                        Row(
                          children: [
                            Icon(Icons.star),
                            Text("4.02 (90 ratings)"),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text("Offer expired after"),
                Text("56h: 32m: 12s"),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    OfferBodyHeaders(
                      text: "Price",
                    ),
                    VerticalDivider(
                      thickness: 5,
                    ),
                    OfferBodyHeaders(
                      text: "Delivery",
                    ),
                    VerticalDivider(
                      thickness: 5,
                    ),
                    OfferBodyHeaders(
                      text: "Distance",
                    ),
                    VerticalDivider(
                      thickness: 5,
                    ),
                    OfferBodyHeaders(
                      text: "items",
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "EGP 43.26",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Payment methods"),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                )
              ]),
            ),
          ),
          Container(
            width: 300,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Accepted",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OfferBodyHeaders extends StatelessWidget {
  const OfferBodyHeaders({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(text), RatingsWidget()],
    );
  }
}

class RatingsWidget extends StatelessWidget {
  const RatingsWidget(
      {super.key,
      this.isRating = false,
      this.count = 90,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.text = 4.02});

  final bool isRating;
  final double text;
  final int count;

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          Icons.star,
          size: 15,
        ),
        Gap(2.w),
        Text(
          "${text.toDouble()} ",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: AppDimensions.regular),
        ),
        isRating
            ? Text(
                "( ${count.toInt()} ratings )",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: AppDimensions.regular),
              )
            : Container(),
      ],
    );
  }
}
