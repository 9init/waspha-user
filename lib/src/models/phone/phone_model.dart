import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_model.freezed.dart';
part 'phone_model.g.dart';

@freezed
class PhoneModel with _$PhoneModel {
  const factory PhoneModel({
    @JsonKey(name: 'country_code') required int countryCode,
    required int number,
  }) = _PhoneModel;

  factory PhoneModel.fromJson(Map<String, dynamic> json) =>
      _$PhoneModelFromJson(json);

  const PhoneModel._();
  String get phoneNumber => "+$countryCode$number";
}
