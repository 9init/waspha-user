import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/buffer_brand/domain/buffer_brand_domain.dart';
import 'package:waspha/src/features/custom_need/presentation/custom_need.dart';

class CancellationReasonsBottomSheet extends StatefulWidget {
  const CancellationReasonsBottomSheet({
    super.key,
  });

  @override
  State<CancellationReasonsBottomSheet> createState() =>
      _CancellationReasonsBottomSheetState();
}

class _CancellationReasonsBottomSheetState
    extends State<CancellationReasonsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Cancelation reason", style: TextStyle(fontSize: 16)),
                CustomCloseButton()
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Consumer(builder: (context, ref, child) {
              final reasons = ref.watch(getCancelReasonsProvider);
              return reasons.when(
                  data: (data) {
                    return Container(
                        child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          CheckboxListTile.adaptive(
                              controlAffinity: ListTileControlAffinity.leading,
                              value: data[index].checked,
                              onChanged: (value) {
                                data[index].checked = !data[index].checked;
                                setState(() {});
                              },
                              title: Text(data[index].value.en)),
                      itemCount: data.length,
                    ));
                  },
                  error: (e, s) {
                    return Container();
                  },
                  loading: () => Center(
                        child: CircularProgressIndicator.adaptive(),
                      ));
            }),
            SizedBox(
              height: 20,
            ),
            Text("Add Description", style: TextStyle(fontSize: 16)),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(0, 3))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintMaxLines: 3,
                      hintText:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                height: 63,
                width: 214,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF663399)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13)))),
                    onPressed: () {
                      context.push('/');
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
