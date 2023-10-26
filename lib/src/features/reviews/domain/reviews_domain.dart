import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/utils/dio_helper.dart';

final getUserReviewsProvider = FutureProvider((ref) async {
  final url = 'user/reviews-ratings';
  try {
    final response = await ref.read(dioProvider).post(url, {});
    return response.data["data"]["reviews_ratings"];
  } catch (e) {}
});
