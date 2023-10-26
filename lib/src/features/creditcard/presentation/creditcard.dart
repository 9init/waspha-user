import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/nearby_store/nearby_store_widget.dart';
import '../../login/domain/login_domain.dart';
import '../../nearby_stores/presentation/nearby_stores.dart';
import '../domain/credit_domain.dart';

class CreditCardScreen extends ConsumerStatefulWidget {
  const CreditCardScreen({super.key});

  @override
  ConsumerState<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends ConsumerState<CreditCardScreen> {
  isLogged() async {
    return ref.read(isLoggedInProvider.future).then((value) {
      if (value == false) {
        return showAdaptiveDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return CustomDialog(
                isLogged: true,
                content: "Please login to see your credit cards",
              );
            });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isLogged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ProfileAppBar(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Credit",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 121,
                child: ListView.separated(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(
                          width: 20,
                        ),
                    itemBuilder: (context, index) {
                      return CredCardWidget();
                    })),
            SizedBox(
              height: 30,
            ),
            Container(
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
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Text("Payment Methods",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final userCredits = ref.watch(getCreditCardsProvider);

                      return userCredits.when(data: (data) {
                        print(data);
                        return Container(
                          height: 120,
                          child: ListView.separated(
                              itemCount: data.length,
                              separatorBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Divider(),
                                  ),
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    ref.read(deleteCreditCardProvider(
                                        id: data?[index]["id"]));
                                  },
                                  child: ListTile(
                                    leading: SvgPicture.asset(
                                      "assets/images/credit/credit_icon.svg",
                                      width: 30,
                                    ),
                                    title: Text(data?[index]["card_number"]),
                                    trailing: Icon(Icons.arrow_forward),
                                  ),
                                );
                              }),
                        );
                      }, error: (e, s) {
                        print(e);
                        return Text("Error");
                      }, loading: () {
                        return Center(child: CircularProgressIndicator());
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.add,
                      size: 30,
                    ),
                    onTap: () => context.push('/add_credit_card'),
                    title: Text(
                      "Add Debit / Credit Card",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CredBigCardWidget(
              text: "Pharmacy Free Delivery",
              header: "Promotions",
              textButton: "Add Promo Code",
              onTextButtonClick: () {},
            ),
            SizedBox(
              height: 30,
            ),
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
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(header,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text(text),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(
              Icons.add,
              size: 30,
            ),
            onTap: onTextButtonClick,
            title: Text(
              textButton,
              style: TextStyle(fontSize: 20),
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
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/credit_detail'),
      child: Container(
        width: 164,
        height: 121,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
                colors: [
                  Colors.grey,
                  Colors.grey,
                  Colors.white,
                  Colors.white,
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "EGP Credit",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "EGP 0.00",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
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
