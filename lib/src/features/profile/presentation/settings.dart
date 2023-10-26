import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../custom_need/presentation/custom_need.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ListTile(
                title: Text("Change Language"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => context.push('/change_location'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Divider(),
              ),
              ListTile(
                title: Text("Night Mode"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Divider(),
              ),
              ListTile(
                title: Text("Show Current Time Zone"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {},
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.4),
              DangerosArea(),
            ],
          ),
        ),
      ]),
    );
  }
}

class DangerosArea extends StatelessWidget {
  const DangerosArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ListTile(
          title: Text("Dangerous Area"),
          trailing: Icon(Icons.info),
        ),
        ElevatedButton(
            onPressed: () {
              context.push('/pending_screen');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delete Account",
                  style: TextStyle(color: Colors.black),
                ),
                Icon(Icons.arrow_forward, color: Colors.black),
              ],
            ))
      ],
    );
  }
}
