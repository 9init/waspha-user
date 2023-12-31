import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waspha/src/widgets/custom_close_button/custom_close_button.dart';


class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key});

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
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Legal",
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
                  title: Text("Terms & Conditions"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () => context.push('/terms'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(),
                ),
                ListTile(
                  title: Text("Privacy Policy"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () => context.push('/privacy'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(),
                ),
                ListTile(
                  title: Text("FAQ"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () => context.push('/faq_screen'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(),
                ),
                ListTile(
                  title: Text("Copyright Policy"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () => context.push('/copyright_policy'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(),
                ),
                ListTile(
                  title: Text("News"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
