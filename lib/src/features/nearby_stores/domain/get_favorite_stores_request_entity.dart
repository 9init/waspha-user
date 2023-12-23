import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_favorite_stores_request_entity.freezed.dart';
@Freezed(fromJson: false, toJson: false,)
class GetFavoriteStoresRequestEntity with _$GetFavoriteStoresRequestEntity {
  const factory GetFavoriteStoresRequestEntity

      ({
    required double lat, required double lng, required num radius
  })=
  _GetFavoriteStoresRequestEntity;
}