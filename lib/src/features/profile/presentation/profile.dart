import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/core/const/colors/colors.dart';
import 'package:waspha/core/extensions/custom_padding/custom_padding.dart';
import 'package:waspha/src/features/activity/offers/presentation/offers.dart';
import 'package:waspha/src/features/custom_need/presentation/custom_need.dart';
import 'package:gap/gap.dart';
import '../domain/profile_domain.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: WasphaColors.transparent,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomCloseButton(),
          )
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final userData = ref.watch(getProfileDataProvider(context));
          return userData.when(
            data: (data) {
              return ListView(
                padding: EdgeInsets.only(top: 20),
                children: [
                  Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => context.push('/edit_profile'),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: CachedNetworkImageProvider(data
                                        .avatar ??
                                    "https://st3.depositphotos.com/9998432/13335/v/450/depositphotos_133352156-stock-illustration-default-placeholder-profile-icon.jpg"),
                              ),
                              Gap(
                                8.h,
                              ),
                              Text(
                                data.name ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: 22.sp),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              RatingsWidget(
                                isRating: true,
                                text: data.rating?.rating ?? 0.0,
                                count: data.rating?.count ?? 0,
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ],
                          ),
                        ),
                        Gap(5.h),
                        CustomButton(
                          onPressed: () => context.push('/reviews_screen'),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.help,
                              size: 80,
                            ),
                            Text(
                              "Help",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.card_giftcard,
                            size: 30,
                          ),
                          title: Text("Invite & Earn"),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.settings,
                            size: 30,
                          ),
                          title: Text("Settings"),
                          onTap: () => context.push('/settings_screen'),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.info,
                            size: 30,
                          ),
                          title: Text("Legal"),
                          onTap: () => context.push('/legal'),
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            return ListTile(
                              leading: Icon(
                                Icons.logout,
                                size: 30,
                              ),
                              title: Text("Sign out"),
                              onTap: () => ref.read(signedOutProvider(context)),
                            );
                          },
                        )
                      ],
                    ).PaddingColumn(paddingLeft: 16),
                  )
                ],
              );
            },
            error: (e, s) {
              return Center(child: Text("Error"));
            },
            loading: () => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text = "Reviews",
    this.iconNeeded = true,
    required this.onPressed,
  });

  final String text;
  final bool iconNeeded;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 135.w, height: 40.h),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: WasphaColors.primary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Expanded(
              child: Visibility(
                visible: iconNeeded,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
