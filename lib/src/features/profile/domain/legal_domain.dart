import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/utils/dio_helper.dart';

final getTermsProvider = FutureProvider((ref) async {
  final String url = 'user/waspha-terms-n-conditions';
  try {
    final request = await ref.watch(dioProvider).post(url, {});
    return request.data["data"];
  } catch (e) {}
});

final getPrivacyProvider = FutureProvider((ref) async {
  final String url = 'user/waspha-privacy-policy';
  try {
    final request = await ref.watch(dioProvider).post(url, {});
    return request.data["data"];
  } catch (e) {}
});

final getCopyRightPolicyProvider = FutureProvider((ref) async {
  final String url = 'user/waspha-copyright-policy';
  try {
    final request = await ref.watch(dioProvider).post(url, {});
    return request.data["data"];
  } catch (e) {}
});

final getFAQProvider = FutureProvider((ref) async {
  final String url = 'user/faq-listing';
  try {
    final request = await ref.watch(dioProvider).post(url, {});
    return request.data["data"];
  } catch (e) {}
});
