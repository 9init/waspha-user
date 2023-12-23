import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

import '../data/credit_data.dart';

part 'credit_domain.g.dart';
@immutable
class AddCardResponse {
  final AddCardResult result;
  final String message;

  const AddCardResponse({
    required this.result,
    required this.message,
  });
}
enum AddCardResult {
  success,
  failure,
  error,
}

@riverpod
Future<AddCardResponse> addCreditCard(Ref ref,
    {required String cardNumber, required String cardName, required String cvv, required int expMonth, required int expYear}) async {
  final url = "/credit-card";
  final result = await Networking.post(url, {
    "cardNumber": cardNumber,
    "cardholderName": cardName,
    "expirationMonth": expMonth,
    "expirationYear": expYear,
    "cvv": cvv,
  });
  switch (result) {
    case Success(value: final value):
      final message = value.data['message'];
      debugPrint('The Result From Api Is $message');
      return AddCardResponse(result: AddCardResult.success, message: message);
    case Failure(failure: final f):
      debugPrint("ADD CARD ERROR ${f.message}");
      return AddCardResponse(result: AddCardResult.failure, message: "");
    case Error(exception: final e):
      debugPrint("ADD CARD ERROR $e");
      return AddCardResponse(result: AddCardResult.error, message: "");
  }
}
@riverpod
Future<List<Credit>> getCreditCards(Ref ref) async {
  final url = "/credit-cards";
  final result = await Networking.get(url);

  return switch (result) {
  Success(value: final value)
  =>
      value.data["data"].map<Credit>((e) => Credit.fromJson(e)).toList()
  ,
  Failure() => [],
  Error() =>
  [
  ]
  ,
};
}

@riverpod
Future<String> deleteCreditCard(Ref ref, {required int id}) async {
  final url = "/credit-card/$id";
  final result = await Networking.delete(url);

  return switch (result) {
  Success(value: final value)
  =>
  value.data["message"]
  ,
  Failure() => "",
  Error() =>""
};
}

@riverpod
Future<List<dynamic>> getWallets(Ref ref) async {
  final url = "/get-wallets";
  final result = await Networking.get(url);

  return switch (result) {
  Success(value: final value)
  =>
  value.data["data"]
  ,
  Failure() => [],
  Error() =>
  [
  ]
  ,
};
}
