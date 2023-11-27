import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

final getTermsProvider = FutureProvider((ref) async {
  final String url = '/waspha-terms-n-conditions';
  final result = await Networking.post(url, {});
  if (result is Success) {
    final res = (result as Success).value as Response<dynamic>;
    return res.data["data"];
  }
});

final getPrivacyProvider = FutureProvider((ref) async {
  final String url = '/waspha-privacy-policy';
  final result = await Networking.post(url, {});
  if (result is Success) {
    final res = (result as Success).value as Response<dynamic>;
    return res.data["data"];
  }
});

final getCopyRightPolicyProvider = FutureProvider((ref) async {
  final String url = '/waspha-copyright-policy';
  final result = await Networking.post(url, {});
  if (result is Success) {
    final res = (result as Success).value as Response<dynamic>;
    return res.data["data"];
  }
});

final getFAQProvider = FutureProvider((ref) async {
  final String url = '/faq-listing';
  final result = await Networking.post(url, {});
  if (result is Success) {
    final res = (result as Success).value as Response<dynamic>;
    return res.data["data"];
  }
});
