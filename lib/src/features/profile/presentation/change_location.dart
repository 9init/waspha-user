import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/widgets/custom_back_button/custom_back_button.dart';

import '../domain/profile_domain.dart';

class ChangeLocationScreen extends StatelessWidget {
  const ChangeLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomBackButton(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer(
          builder: (context, ref, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Change Language",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () async {
                  await ref
                      .read(changeLanguageProvider("en").future)
                      .whenComplete(() {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Language Changed Successfully")));
                  });
                  context.pop();
                },
                title: Text("English"),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  onTap: () async {
                    await ref
                        .read(changeLanguageProvider("ar").future)
                        .whenComplete(() {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("تم تغيير اللغة بنجاح")));
                    });
                    context.pop();
                  },
                  title: Text("العربية"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
