import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../custom_need/presentation/custom_need.dart';
import '../domain/legal_domain.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(alignment: Alignment.topLeft, child: CustomBackButton()),
                SizedBox(
                  height: 20,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final terms = ref.watch(getPrivacyProvider);
                    return terms.when(
                        data: (data) {
                          return Html(data: data["en"]);
                        },
                        error: (e, s) {
                          return Text("Error");
                        },
                        loading: () => CircularProgressIndicator());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
