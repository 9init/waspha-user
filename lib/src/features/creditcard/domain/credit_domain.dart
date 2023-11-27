import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

import '../data/credit_data.dart';

part 'credit_domain.g.dart';

@riverpod
Future<String> addCreditCard(Ref ref,
    {required String cardNumber,
    required String cardName,
    required String cvv,
    required int expMonth,
    required int expYear}) async {
  final url = "/credit-card";
  final result = await Networking.post(url, {
    "cardNumber": cardNumber,
    "cardholderName": cardName,
    "expirationMonth": expMonth,
    "expirationYear": expYear,
    "cvv": cvv,
  });

  return switch (result) {
    Success(value: final value) => value.data["message"],
    Failure() => "",
    Error() => "",
  };
}

@riverpod
Future<List<Credit>> getCreditCards(Ref ref) async {
  final url = "/credit-cards";
  final result = await Networking.get(url);

  return switch (result) {
    Success(value: final value) =>
      value.data["data"].map<Credit>((e) => Credit.fromJson(e)).toList(),
    Failure() => [],
    Error() => [],
  };
}

@riverpod
Future<String> deleteCreditCard(Ref ref, {required int id}) async {
  final url = "/credit-card/$id";
  final result = await Networking.delete(url);

  return switch (result) {
    Success(value: final value) => value.data["message"],
    Failure() => "",
    Error() => "",
  };
}

@riverpod
Future<List<dynamic>> getWallets(Ref ref) async {
  final url = "/get-wallets";
  final result = await Networking.get(url);

  return switch (result) {
    Success(value: final value) => value.data["data"],
    Failure() => [],
    Error() => [],
  };
}
