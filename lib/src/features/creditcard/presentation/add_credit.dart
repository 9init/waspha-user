
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/creditcard/domain/credit_domain.dart';
import 'package:waspha/src/features/custom_need/presentation/custom_need.dart';

import '../../../widgets/auth_btn/auth_btn.dart';

class AddCreditCard extends HookWidget {
  AddCreditCard({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>>? cvvCodeKey =
      GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    final cardNumber = useState('');
    final expiredData = useState('');
    final cvv = useState('');
    final cardHolder = useState('');
    final isBack = useState(false);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomBackButton(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber.value,
              expiryDate: expiredData.value, // Required
              cardHolderName: cardHolder.value, // Required
              cvvCode: cvv.value, // Required
              showBackView: isBack.value,
              onCreditCardWidgetChange: (CreditCardBrand brand) {},
              glassmorphismConfig: Glassmorphism.defaultConfig(),
              enableFloatingCard: true,
              floatingConfig: FloatingConfig(
                isGlareEnabled: true,
                isShadowEnabled: true,
                shadowConfig: FloatingShadowConfig(),
              ),
              labelValidThru: 'VALID\nTHRU',
              obscureCardNumber: true,
              obscureInitialCardNumber: false,
              obscureCardCvv: true,
              labelCardHolder: 'CARD HOLDER',
              height: 175,
              cardType: CardType.otherBrand,

              width: MediaQuery.of(context).size.width,
              padding: 16,
              customCardTypeIcons: [
                CustomCardTypeIcon(
                    cardType: CardType.otherBrand,
                    cardImage: SvgPicture.asset(
                        "assets/images/credit/meeza.svg",
                        width: 30))
              ],
            ),
            CreditCardForm(
              formKey: formKey, // Required
              cardNumber: cardNumber.value, // Required
              expiryDate: expiredData.value, // Required
              cardHolderName: cardHolder.value, // Required
              cvvCode: cvv.value, // Required
              onCreditCardModelChange: (CreditCardModel data) {
                cardNumber.value = data.cardNumber;
                expiredData.value = data.expiryDate;
                cvv.value = data.cvvCode;
                cardHolder.value = data.cardHolderName;
                // ignore: invalid_use_of_protected_member
                cvvCodeKey!.currentState!.setState(() {
                  isBack.value = data.isCvvFocused;
                });
              }, // Required
              obscureCvv: true,
              obscureNumber: true,
              isHolderNameVisible: true,
              isCardNumberVisible: true,
              isExpiryDateVisible: true,
              enableCvv: true,

              cvvCodeKey: cvvCodeKey,
              cvvValidationMessage: 'Please input a valid CVV',
              dateValidationMessage: 'Please input a valid date',
              numberValidationMessage: 'Please input a valid number',
              cardNumberValidator: (String? cardNumber) {
                if (cardNumber!.isEmpty) {
                  return 'Please enter a valid card number';
                }
                return null;
              },
              expiryDateValidator: (String? expiryDate) {
                if (expiryDate!.isEmpty) {
                  return 'Please enter a valid expiry date';
                }
                return null;
              },
              cvvValidator: (String? cvv) {
                if (cvv!.isEmpty) {
                  return 'Please enter a valid CVV';
                }
                return null;
              },
              cardHolderValidator: (String? cardHolderName) {
                if (cardHolderName!.isEmpty) {
                  return 'Please enter a valid card holder name';
                }
                return null;
              },

              autovalidateMode: AutovalidateMode.always,
              disableCardNumberAutoFillHints: false,
              inputConfiguration: const InputConfiguration(
                cardNumberDecoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number',
                  hintText: 'XXXX XXXX XXXX XXXX',
                ),
                expiryDateDecoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Expired Date',
                  hintText: 'MM/YY',
                ),
                cvvCodeDecoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CVV',
                  hintText: 'XXX',
                ),
                cardHolderDecoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Card Holder Name',
                ),
                cardNumberTextStyle: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
                cardHolderTextStyle: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
                expiryDateTextStyle: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
                cvvCodeTextStyle: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                return AuthButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await ref
                          .read(addCreditCardProvider(
                                  cardNumber: cardNumber.value,
                                  cardName: cardHolder.value,
                                  cvv: cvv.value,
                                  expMonth: int.parse(
                                      expiredData.value.split("/")[0]),
                                  expYear: int.parse(
                                      expiredData.value.split("/")[1]))
                              .future)
                          .then((value) => ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(value))));
                    }
                  },
                  text: "Add card",
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
