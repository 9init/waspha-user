import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/activity/offers/presentation/offers.dart';
import 'package:waspha/src/features/custom_need/presentation/custom_need.dart';

import '../domain/profile_domain.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
      body: Consumer(
        builder: (context, ref, child) {

          final userData = ref.watch(getProfileDataProvider(context));
          return userData.when(
            data: (data) {
              return Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
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
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  data.name ?? "",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
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
                          SizedBox(
                            height: 5,
                          ),
                          CustomButton(
                            onPressed: () => context.push('/reviews_screen'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Align(
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
                                  onTap: () =>
                                      ref.read(signedOutProvider(context)),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
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
      constraints: BoxConstraints.tightFor(width: 134, height: 40),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF663399),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
              Visibility(
                visible: iconNeeded,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              )
            ],
          )),
    );
  }
}
