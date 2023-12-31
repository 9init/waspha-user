import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/core/assets_gen/assets.gen.dart';
import 'package:waspha/core/const/colors/colors.dart';
import 'package:waspha/core/const/dimension/dimensions.dart';
import 'package:waspha/core/extensions/custom_padding/custom_padding.dart';
import 'package:waspha/core/localization/localization.dart';
import 'package:waspha/src/features/creditcard/domain/credit_domain.dart';
import 'package:gap/gap.dart';
class UserPaymentMethodsView extends StatelessWidget {
  const UserPaymentMethodsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context.localization.payment_methods,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        Consumer(
          builder: (context, ref, child) {
            final userCredits = ref.watch(getCreditCardsProvider);
            return userCredits.when(data: (data) {
              return SizedBox(
                height: 150.h,
                child: ListView.separated(
                    itemCount: data.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          ref.read(
                              deleteCreditCardProvider(id: data[index].id));
                        },
                        child: ListTile(
                          leading: MyAssets.images.credit.creditIcon.svg(
                            width: 30.w,
                          ),
                          title: Row(
                            children: [
                              Text(
                                ".... " +
                                    data[index].card_number.replaceAll("*", ""),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontWeight: AppDimensions.regular),
                              ),
                              Gap(10.w),
                              Expanded(
                                child: Text(
                                  "(${data[index].cardholder_name})",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontWeight: AppDimensions.regular),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                      );
                    }),
              );
            }, error: (e, s) {
              print(e);
              return const Text("Error");
            }, loading: () {
              return const Center(child: CircularProgressIndicator());
            });
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.add,
            size: 30,
            color: WasphaColors.black,
          ),
          onTap: () => context.push('/add_credit_card'),
          title: Text(
            context.localization.add_debit_or_credit_card,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: AppDimensions.semiBold,
                fontSize: AppDimensions.textSizeLarge),
          ),
        ),
      ],
    ).PaddingColumn(paddingTop: 5,paddingLeft: 20,paddingRight: 20);
  }
}
