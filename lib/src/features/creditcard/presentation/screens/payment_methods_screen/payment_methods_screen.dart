import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/core/extensions/custom_padding/custom_padding.dart';
import 'package:waspha/src/features/creditcard/presentation/screens/payment_methods_screen/widgets/index.dart';

import '../../../../../widgets/nearby_store/nearby_store_widget.dart';
import '../../../../../widgets/need_login.dart';
import '../../../../login/domain/login_domain.dart';

class CreditCardScreen extends ConsumerStatefulWidget {
  const CreditCardScreen({super.key});

  @override
  ConsumerState<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends ConsumerState<CreditCardScreen> {
  @override
  Widget build(BuildContext context) {
    final isLogged = ref.watch(isLoggedInProvider);
    return isLogged.when(data: (data) {
      if (data == false) {
        return const NeedLoginScreen();
      }
      return const CreditCardLogged();
    }, error: (e, s) {
      return const Text("Error");
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }
}

class CreditCardLogged extends StatelessWidget {
  const CreditCardLogged({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ProfileAppBar(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          UserPaymentsTransaction(),
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                height: 260.h,
                width: 348.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: UserPaymentMethodsView(),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 5),
          //     child: Container(
          //       height: 248,
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(18),
          //           boxShadow: [
          //             BoxShadow(
          //                 color: Colors.black.withOpacity(0.1),
          //                 blurRadius: 10,
          //                 spreadRadius: 1)
          //           ]),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           const Padding(
          //             padding: EdgeInsets.only(top: 10, left: 20),
          //             child: Text("Promotions",
          //                 style: TextStyle(
          //                     fontSize: 20, fontWeight: FontWeight.bold)),
          //           ),
          //           const SizedBox(
          //             height: 5,
          //           ),
          //           SizedBox(
          //             height: 120,
          //             child: ListView.separated(
          //                 itemCount: 2,
          //                 separatorBuilder: (context, index) => Padding(
          //                       padding: const EdgeInsets.symmetric(
          //                           horizontal: 30),
          //                       child: Divider(),
          //                     ),
          //                 itemBuilder: (context, index) {
          //                   return ListTile(
          //                     leading: SvgPicture.asset(
          //                       "assets/images/credit/credit_icon.svg",
          //                       width: 30,
          //                     ),
          //                     title: Text("Pharmacy Free Delivery"),
          //                     trailing: const Icon(Icons.arrow_forward),
          //                   );
          //                 }),
          //           ),
          //           ListTile(
          //             leading: const Icon(
          //               Icons.add,
          //               size: 30,
          //             ),
          //             onTap: () => context.push('/add_credit_card'),
          //             title: const Text(
          //               "Add Promo Code",
          //               style: TextStyle(fontSize: 20),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
        ]).PaddingColumn(paddingRight: 10, paddingLeft: 10),
      ),
    );
  }
}


