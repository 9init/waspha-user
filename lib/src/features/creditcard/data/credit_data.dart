import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_data.freezed.dart';
part 'credit_data.g.dart';

@freezed
class Credit with _$Credit {
  const factory Credit({
    required int id,
    required String card_number,
    required String cardholder_name,
    required int expiration_month,
    required int expiration_year,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Credit;
  factory Credit.fromJson(json) => _$CreditFromJson(json);
}
