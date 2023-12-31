import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:waspha/core/const/colors/colors.dart';
import 'package:waspha/core/const/dimension/dimensions.dart';
import 'package:waspha/core/di/index.dart';
import 'package:waspha/core/extensions/custom_padding/custom_padding.dart';
import 'package:waspha/core/helper_functions/pick_image/picke_image.dart';
import 'package:waspha/src/features/custom_need/presentation/widgets/photo_picker_dialog.dart';
import 'package:waspha/src/widgets/custom_close_button/custom_close_button.dart';

import '../domain/profile_domain.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final choosePickedImage = di<ImagePickerProvider>();
    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final userData = ref.watch(getProfileDataProvider(context));

          return userData.when(data: (data) {
            print(data);
            final String contactVerified =
                data.is_contact_verified == true ? "Verified" : "Unverified";
            final String emailVerified =
                data.is_email_verified == true ? "Verified" : "Unverified";

            final Color contactVerifiedColor =
                data.is_contact_verified == true ? Colors.green : Colors.red;
            final Color emailVerifiedColor =
                data.is_email_verified == true ? Colors.green : Colors.red;
debugPrint('The Date Of Birth Is ${data.dob}');
            final dob = DateFormat.yMd().format(DateTime.parse(data.dob.toString()));
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(
                  height: AppDimensions.heightExtraLarge,
                  width: AppDimensions.widthExtraLarge,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      CircleAvatar(
                        radius: AppDimensions.borderLarge,
                        backgroundImage:
                            choosePickedImage.chosenImagePath.isNotEmpty
                                ? Image.file(
                                    File(choosePickedImage.chosenImagePath),
                                  ).image
                                : CachedNetworkImageProvider(
                                    data.avatar ??
                                        '', // Replace with a placeholder image URL
                                  ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25.r,
                        child: IconButton(
                          onPressed: () async {
                            showAdaptiveDialog(
                              context: context,
                              builder: (context) => PhotoPickerDialog(),
                            ).then(
                              (value) {
                                debugPrint(
                                    'The Image Taken Is ${choosePickedImage.chosenImagePath}');

                                // This setState will trigger a rebuild when the dialog is closed
                                setState(() {});
                                //TODO//:Remove That setState After Finishing Study Riverpod Migration
                                ref
                                    .watch(updateImageProvider(
                                            choosePickedImage.chosenImagePath)
                                        .future)
                                    .whenComplete(
                                  () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Image Updated"),
                                      ),
                                    );
                                  },
                                );
                                ref
                                    .refresh(getProfileDataProvider(context))
                                    .value;
                              },
                            );
                          },
                          icon: Icon(Icons.edit),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ).center(),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: Text("Name"),
                  trailing: Icon(Icons.arrow_forward),
                  subtitle: Text(data.name.toString()),
                  onTap: () => context.push('/update_profile',
                      extra: {"isNumber": false, "name": data.name}),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Text("Phone Number"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        contactVerified,
                        style: TextStyle(color: contactVerifiedColor),
                      )
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  subtitle: Text("+${data.country?.phonecode} ${data.contact}"),
                  onTap: () => context.push('/update_profile', extra: {
                    "isNumber": true,
                    "iso": IsoCode.fromJson(data.country!.iso),
                    "nsn": data.contact
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Text("Email"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        emailVerified,
                        style: TextStyle(color: emailVerifiedColor),
                      )
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  subtitle: Text(data.email.toString()),
                  onTap: () => context.push('/update_profile', extra: {
                    "isNumber": false,
                    "name": data.email,
                    "isEmail": true
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(),
                ),
                ListTile(
                  title: Text("Password"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(),
                ),
                ListTile(
                  title: Text("Gender"),
                  subtitle: Text(data.gender.toString()),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () => context.push('/update_gender'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(),
                ),
                ListTile(
                  title: Text("Date of birth"),
                  subtitle: Text("$dob"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () => context.push('/update_dob'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Divider(),
                ),
              ],
            );
          }, error: (e, s) {
            return Center(child: Text("Error"));
          }, loading: () {
            return Center(child: CircularProgressIndicator());
          });
        }),
      ),
    );
  }
}
