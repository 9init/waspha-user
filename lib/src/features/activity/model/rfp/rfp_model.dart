import 'package:freezed_annotation/freezed_annotation.dart';

part 'rfp_model.freezed.dart';
part 'rfp_model.g.dart';

@freezed
abstract class RfpModel with _$RfpModel {
  const factory RfpModel({
    required int id,
    required DateTime order_date,
    required DateTime expiry_time,
    required String type,
    required int total_proposals,
    required String rfp_status,
    required String status,
    required CategoryModel category,
    required List<StoreModel> stores,
  }) = _RfpModel;

  factory RfpModel.fromJson(Map<String, dynamic> json) =>
      _$RfpModelFromJson(json);
}

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required Map<String, String> name,
    required String image,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
abstract class StoreModel with _$StoreModel {
  const factory StoreModel({
    required String name,
    required int id,
    required String image,
  }) = _StoreModel;

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
}
