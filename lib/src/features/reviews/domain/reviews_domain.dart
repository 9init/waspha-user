import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

final getUserReviewsProvider = FutureProvider((ref) async {
  final url = 'user/reviews-ratings';
  final result = await Networking.post(url, {});
  if (!(result is Success)) return;

  final response = (result as Success).value;
  return response.data["data"]["reviews_ratings"];
});
