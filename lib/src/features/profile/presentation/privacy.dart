import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/widgets/custom_back_button/custom_back_button.dart';

import '../domain/legal_domain.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
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
                      loading: () => Center(child: CircularProgressIndicator()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
