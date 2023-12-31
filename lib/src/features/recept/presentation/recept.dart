import 'package:flutter/material.dart';
import 'package:waspha/src/widgets/custom_back_button/custom_back_button.dart';

class ReceptScreen extends StatelessWidget {
  final isDraft;
  const ReceptScreen({super.key, this.isDraft = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomBackButton(),
        ),
        title: Text(
          isDraft ? "Draft Receipt" : "Receipt",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                    width: 130,
                    child: Text("Hani, shukran for using Waspha",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ),
              Visibility(
                visible: isDraft,
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF663399),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                  ),
                  child: Center(
                      child: Text("Draft",
                          style: TextStyle(color: Colors.white, fontSize: 16))),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Offer #128", style: TextStyle(fontSize: 16)),
                    Text("Delivery", style: TextStyle(fontSize: 16)),
                    Text("20/8/2021 11:23 AM", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/250?image=9'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Noon Express ..",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("To be paid", style: TextStyle(fontSize: 13)),
          Text("PAID",
              style: TextStyle(
                fontSize: 25,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Divider(
              thickness: 2,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Payment methods", style: TextStyle(fontSize: 13)),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.credit_card,
                  size: 30,
                ),
                Text("Online Payments", style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
          Text("KWD 7.00",
              style: TextStyle(
                fontSize: 25,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Divider(
              thickness: 2,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Receipt details", style: TextStyle(fontSize: 13)),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text("KWD 7.00",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Divider(
              thickness: 2,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: isDraft,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyle(fontSize: 25)),
                  Text("KWD 7.00", style: TextStyle(fontSize: 25)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal", style: TextStyle(fontSize: 20)),
                Text("KWD 6.00", style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Waspha fee Fixed", style: TextStyle(fontSize: 15)),
                Text("KWD 1.00", style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("1 x Item 1", style: TextStyle(fontSize: 14)),
                          Text("FREE", style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    );
                  })),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Divider(
              thickness: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery fee", style: TextStyle(fontSize: 14)),
                Text("KWD 1.00", style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pickup fee", style: TextStyle(fontSize: 14)),
                Text("KWD 1.00", style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Divider(
              thickness: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Cancelation fee", style: TextStyle(fontSize: 14)),
                Text("KWD 1.00", style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      NetworkImage('https://picsum.photos/250?image=9'),
                ),
                SizedBox(
                  width: 23,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text("Mustafa"),
                        SizedBox(width: 10),
                        Text('4.9'),
                        Icon(Icons.star)
                      ],
                    ),
                    Text("Scooter - Honda")
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 50,
              width: 100,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: Color(0xFF663399),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: Center(
                  child: Text("Print Receipt",
                      style: TextStyle(color: Colors.white, fontSize: 14))),
            ),
          ),
          Visibility(
            visible: isDraft,
            child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 300, height: 50),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF663399),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: Text(
                      "Resend by email",
                      style: TextStyle(fontSize: 13, color: Colors.white),
                    ))),
          ),
        ]),
      ),
    );
  }
}
