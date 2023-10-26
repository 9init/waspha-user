// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Credit _$$_CreditFromJson(Map<String, dynamic> json) => _$_Credit(
      id: json['id'] as int,
      card_number: json['card_number'] as String,
      cardholder_name: json['cardholder_name'] as String,
      expiration_month: json['expiration_month'] as int,
      expiration_year: json['expiration_year'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_CreditToJson(_$_Credit instance) => <String, dynamic>{
      'id': instance.id,
      'card_number': instance.card_number,
      'cardholder_name': instance.cardholder_name,
      'expiration_month': instance.expiration_month,
      'expiration_year': instance.expiration_year,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
