import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/widgets/custom_back_button/custom_back_button.dart';

import '../domain/legal_domain.dart';
import 'package:gap/gap.dart';

class CopyRightPolicyScreen extends StatelessWidget {
  const CopyRightPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Align(alignment: Alignment.topLeft, child: CustomBackButton()),
              Gap(20.h),
              Consumer(
                builder: (context, ref, child) {
                  final terms = ref.watch(getCopyRightPolicyProvider);
                  return terms.when(
                    data: (data) {
                      return Html(data: data["en"]);
                    },
                    error: (e, s) {
                      return Text("Error");
                    },
                    loading: () => Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
