import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:waspha/core/assets_gen/assets.gen.dart';
import 'package:waspha/core/localization/localization.dart';
import 'package:waspha/src/features/profile/presentation/profile.dart';
import 'package:gap/gap.dart';

class NeedLoginScreen extends StatelessWidget {
  const NeedLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(40),
          Text(
            context.localization
                .you_need_to_login_to_add_this_store_to_your_favorites,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onPressed: () => context.go('/register'),
                text: "Register",
                iconNeeded: false,
              ),
              SizedBox(width: 10),
              CustomButton(
                onPressed: () => context.go('/login'),
                text: context.localization.login,
                iconNeeded: false,
              ),
            ],
          ),
          Gap(70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MyAssets.images.nearby.login.svg(height: 350.h,width: 75.w),
          ),
        ],
      ),
    );
  }
}
