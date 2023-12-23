import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/custom_need/presentation/custom_need.dart';

import '../domain/legal_domain.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomBackButton(),
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "FAQ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final faqData = ref.watch(getFAQProvider);
            return faqData.when(data: (data) {
              return Expanded(
                child: ListView.separated(
                    itemCount: data.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return Theme(
                        data: ThemeData().copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          textColor: Colors.purple,
                          iconColor: Colors.purple,
                          title: Text(data[index]["title"],
                            style: TextStyle(fontSize: 18)),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(data[index]["description"],
                                style: TextStyle(fontSize: 16)),
                            )
                          ],
                        ),
                      );
                    }),
              );
            }, error: (e, s) {
              return Center(child: Text("Error"));
            }, loading: () {
              return Center(child: CircularProgressIndicator());
            });
          }),
        ],
      ),
    );
  }
}
