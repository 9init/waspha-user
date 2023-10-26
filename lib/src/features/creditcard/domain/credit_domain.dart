import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/utils/dio_helper.dart';


part 'credit_domain.g.dart';

@riverpod
Future<String> addCreditCard(Ref ref,
    {required String cardNumber,
    required String cardName,
    required String cvv,
    required int expMonth,
    required int expYear}) async {
  final url = "user/credit-card";
  try {
    print("Hi");
    final request = await ref.watch(dioProvider).post(url, {
      "cardNumber": cardNumber, 
      "cardholderName": cardName,
      "expirationMonth": expMonth,
      "expirationYear": expYear,
      "cvv": cvv
    });
    print("ADD CREDIT: ${request.data}");
    return request.data["message"];
  } catch (e) {}
  return "";
}

@riverpod
Future getCreditCards(Ref ref) async {
  final url = "user/credit-cards";
  try {
    final request = await ref.watch(dioProvider).get(url);
    return request.data["data"];
  } catch (e) {}
  return [];
}

@riverpod
Future<String> deleteCreditCard(Ref ref, {required int id}) async {
  final url = "user/credit-card/$id";
  try {
    final request = await ref.watch(dioProvider).delete(url);
    return request.data["message"];
  } catch (e) {}
  return "";
}
