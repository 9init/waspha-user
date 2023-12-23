import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_favorite_stores_request_model.freezed.dart';
part 'get_favorite_stores_request_model.g.dart';
@Freezed(
  fromJson: false,
  toJson: true,
)
class GetFavoriteStoresRequestModel with _$GetFavoriteStoresRequestModel {
  const factory GetFavoriteStoresRequestModel(
      {required double lat,
      required double lng,
      required num radius}) = _GetFavoriteStoresRequestModel;
}
