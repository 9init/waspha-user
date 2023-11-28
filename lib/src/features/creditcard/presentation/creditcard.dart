import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/nearby_store/nearby_store_widget.dart';
import '../../../widgets/need_login.dart';
import '../../login/domain/login_domain.dart';
import '../domain/credit_domain.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Credit",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer(builder: (context, ref, child) {
              final userCredits = ref.watch(getWalletsProvider);
              return userCredits.when(
                  data: (data) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 121,
                        child: ListView.separated(
                            itemCount: data.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 20,
                                ),
                            itemBuilder: (context, index) {
                              return CredCardWidget(
                                currency: data[index]["currency"],
                                amount: data[index]["amount"].toString(),
                              );
                            }));
                  },
                  error: (e, s) {
                    return Text("Error");
                  },
                  loading: () => CircularProgressIndicator());
            }),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 248,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Text("Payment Methods",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          final userCredits = ref.watch(getCreditCardsProvider);

                          return userCredits.when(data: (data) {
                            return SizedBox(
                              height: 120,
                              child: ListView.separated(
                                  itemCount: data.length,
                                  separatorBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Divider(),
                                      ),
                                  itemBuilder: (context, index) {
                                    return Dismissible(
                                      key: UniqueKey(),
                                      onDismissed: (direction) {
                                        ref.read(deleteCreditCardProvider(
                                            id: data[index].id));
                                      },
                                      child: ListTile(
                                        leading: SvgPicture.asset(
                                          "assets/images/credit/credit_icon.svg",
                                          width: 30,
                                        ),
                                        title: Text(
                                          ".... " +
                                              data[index]
                                                  .card_number
                                                  .replaceAll("*", ""),
                                        ),
                                        trailing:
                                            const Icon(Icons.arrow_forward),
                                      ),
                                    );
                                  }),
                            );
                          }, error: (e, s) {
                            print(e);
                            return const Text("Error");
                          }, loading: () {
                            return const Center(
                                child: CircularProgressIndicator());
                          });
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.add,
                          size: 30,
                        ),
                        onTap: () => context.push('/add_credit_card'),
                        title: const Text(
                          "Add Debit / Credit Card",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
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
          ]),
        ),
      ),
    );
  }
}

class CredBigCardWidget extends StatelessWidget {
  const CredBigCardWidget({
    super.key,
    required this.text,
    required this.header,
    required this.textButton,
    required this.onTextButtonClick,
  });
  final String text, header, textButton;
  final VoidCallback onTextButtonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348,
      height: 248,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 20),
            child: Text(header,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.credit_card),
            title: Text(text),
            trailing: const Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: const Icon(
              Icons.add,
              size: 30,
            ),
            onTap: onTextButtonClick,
            title: Text(
              textButton,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class CredCardWidget extends StatelessWidget {
  const CredCardWidget({
    super.key,
    required this.amount,
    required this.currency,
  });

  final String amount, currency;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => context.push('/credit_detail'),
      child: Container(
        width: 164,
        height: 121,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]!),
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
                colors: [
                  Colors.grey,
                  Colors.grey,
                  Colors.white,
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$currency Wallet",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "$currency $amount",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.arrow_forward)),
            ),
          ],
        ),
      ),
    );
  }
}
