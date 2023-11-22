import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../custom_need/presentation/custom_need.dart';
import '../domain/profile_domain.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

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

            final dob =
                DateFormat.yMd().format(DateTime.parse(data.dob.toString()));
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(data.avatar ?? ""),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: IconButton(
                          onPressed: () async {
                            final ImagePicker picker = ImagePicker();
// Pick an image.
                            final XFile? image = await picker.pickImage(
                                maxHeight: 800,
                                maxWidth: 800,
                                source: ImageSource.gallery);
                            final imageSize = (await image?.length())! / 1024;
                            final imagePath = await image?.path;
                            if (imageSize > 500) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Image too large")));
                            } else {
                              await ref
                                  .watch(updateImageProvider(imagePath!).future)
                                  .whenComplete(() {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Image Updated")));
                              });
                              ref
                                  .refresh(getProfileDataProvider(context))
                                  .value;
                            }
                          },
                          icon: Icon(Icons.edit),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
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
                    subtitle:
                        Text("+${data.country?.phonecode} ${data.contact}"),
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
              ),
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
