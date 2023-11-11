import 'package:freezed_annotation/freezed_annotation.dart';

part 'buffer_data.freezed.dart';
part 'buffer_data.g.dart';

@freezed
class CancelReason with _$CancelReason {
  factory CancelReason({
    required int id,
    required Value value,
  }) = _CancelReason;

  factory CancelReason.fromJson(Map<String, dynamic> json) =>
      _$CancelReasonFromJson(json);
}

@freezed
class Value with _$Value {
  factory Value({
    required String en,
    required String ar,
  }) = _Value;

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}
