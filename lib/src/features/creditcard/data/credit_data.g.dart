// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreditImpl _$$CreditImplFromJson(Map<String, dynamic> json) => _$CreditImpl(
      id: json['id'] as int,
      card_number: json['card_number'] as String,
      cardholder_name: json['cardholder_name'] as String,
      expiration_month: json['expiration_month'] as int,
      expiration_year: json['expiration_year'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CreditImplToJson(_$CreditImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'card_number': instance.card_number,
      'cardholder_name': instance.cardholder_name,
      'expiration_month': instance.expiration_month,
      'expiration_year': instance.expiration_year,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
