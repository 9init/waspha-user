import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/core/localization/localization.dart';
import 'package:waspha/src/features/creditcard/domain/credit_domain.dart';
import 'package:waspha/src/features/creditcard/presentation/screens/payment_methods_screen/widgets/index.dart';

class UserPaymentsTransaction extends StatelessWidget {
  const UserPaymentsTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.credit,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(fontSize: 30.sp),
        ),
        SizedBox(
          height: 30.h,
        ),
        Consumer(builder: (context, ref, child) {
          final userCredits = ref.watch(getWalletsProvider);
          return userCredits.when(
              data: (data) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 121.h,
                  child: ListView.separated(
                    itemCount: data.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20.w,
                    ),
                    itemBuilder: (context, index) {
                      return CredCardWidget(
                        currency: data[index]["currency"],
                        amount: data[index]["amount"].toString(),
                      );
                    },
                  ),
                );
              },
              error: (e, s) {
                return Text("Error");
              },
              loading: () => CircularProgressIndicator());
        }),
      ],
    );
  }
}
