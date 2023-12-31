
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/profile/presentation/profile.dart';
import 'package:waspha/src/widgets/custom_close_button/custom_close_button.dart';

import '../domain/profile_domain.dart';

class PendingTasksScreen extends HookWidget {
  const PendingTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isProgress = useState<bool>(false);
    final isCredit = useState<bool>(false);

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pending Tasks",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text("""
      When you delete your account, your profile, 
      photos, comments, likes, orders, addressee 
      and all your history will be permanently 
      removed. So please double check below 
      pending tasks if any to complete your action.
      """),
            SizedBox(
              height: 30,
            ),
            CheckboxListTile(
              title: Text("Competing all in progress orders"),
              value: isProgress.value,
              onChanged: (value) {
                isProgress.value = value!;
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            CheckboxListTile(
              title: Text("Your Credit balance become zero"),
              value: isCredit.value,
              onChanged: (value) {
                isCredit.value = value!;
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CustomButton(
                text: "Refresh",
                onPressed: () {},
                iconNeeded: false,
              ),
            ),
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Consumer(
                builder: (context, ref, child) => ElevatedButton(
                    onPressed: () async =>
                        await ref.read(deleteAccountProvider(context).future),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13)),
                    ),
                    child: Text(
                      "Confirm Deleting",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
