// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Credit _$CreditFromJson(Map<String, dynamic> json) {
  return _Credit.fromJson(json);
}

/// @nodoc
mixin _$Credit {
  int get id => throw _privateConstructorUsedError;
  String get card_number => throw _privateConstructorUsedError;
  String get cardholder_name => throw _privateConstructorUsedError;
  int get expiration_month => throw _privateConstructorUsedError;
  int get expiration_year => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreditCopyWith<Credit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditCopyWith<$Res> {
  factory $CreditCopyWith(Credit value, $Res Function(Credit) then) =
      _$CreditCopyWithImpl<$Res, Credit>;
  @useResult
  $Res call(
      {int id,
      String card_number,
      String cardholder_name,
      int expiration_month,
      int expiration_year,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$CreditCopyWithImpl<$Res, $Val extends Credit>
    implements $CreditCopyWith<$Res> {
  _$CreditCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? card_number = null,
    Object? cardholder_name = null,
    Object? expiration_month = null,
    Object? expiration_year = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      card_number: null == card_number
          ? _value.card_number
          : card_number // ignore: cast_nullable_to_non_nullable
              as String,
      cardholder_name: null == cardholder_name
          ? _value.cardholder_name
          : cardholder_name // ignore: cast_nullable_to_non_nullable
              as String,
      expiration_month: null == expiration_month
          ? _value.expiration_month
          : expiration_month // ignore: cast_nullable_to_non_nullable
              as int,
      expiration_year: null == expiration_year
          ? _value.expiration_year
          : expiration_year // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditImplCopyWith<$Res> implements $CreditCopyWith<$Res> {
  factory _$$CreditImplCopyWith(
          _$CreditImpl value, $Res Function(_$CreditImpl) then) =
      __$$CreditImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String card_number,
      String cardholder_name,
      int expiration_month,
      int expiration_year,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$CreditImplCopyWithImpl<$Res>
    extends _$CreditCopyWithImpl<$Res, _$CreditImpl>
    implements _$$CreditImplCopyWith<$Res> {
  __$$CreditImplCopyWithImpl(
      _$CreditImpl _value, $Res Function(_$CreditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? card_number = null,
    Object? cardholder_name = null,
    Object? expiration_month = null,
    Object? expiration_year = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CreditImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      card_number: null == card_number
          ? _value.card_number
          : card_number // ignore: cast_nullable_to_non_nullable
              as String,
      cardholder_name: null == cardholder_name
          ? _value.cardholder_name
          : cardholder_name // ignore: cast_nullable_to_non_nullable
              as String,
      expiration_month: null == expiration_month
          ? _value.expiration_month
          : expiration_month // ignore: cast_nullable_to_non_nullable
              as int,
      expiration_year: null == expiration_year
          ? _value.expiration_year
          : expiration_year // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreditImpl implements _Credit {
  const _$CreditImpl(
      {required this.id,
      required this.card_number,
      required this.cardholder_name,
      required this.expiration_month,
      required this.expiration_year,
      required this.createdAt,
      required this.updatedAt});

  factory _$CreditImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreditImplFromJson(json);

  @override
  final int id;
  @override
  final String card_number;
  @override
  final String cardholder_name;
  @override
  final int expiration_month;
  @override
  final int expiration_year;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Credit(id: $id, card_number: $card_number, cardholder_name: $cardholder_name, expiration_month: $expiration_month, expiration_year: $expiration_year, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.card_number, card_number) ||
                other.card_number == card_number) &&
            (identical(other.cardholder_name, cardholder_name) ||
                other.cardholder_name == cardholder_name) &&
            (identical(other.expiration_month, expiration_month) ||
                other.expiration_month == expiration_month) &&
            (identical(other.expiration_year, expiration_year) ||
                other.expiration_year == expiration_year) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, card_number, cardholder_name,
      expiration_month, expiration_year, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditImplCopyWith<_$CreditImpl> get copyWith =>
      __$$CreditImplCopyWithImpl<_$CreditImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreditImplToJson(
      this,
    );
  }
}

abstract class _Credit implements Credit {
  const factory _Credit(
      {required final int id,
      required final String card_number,
      required final String cardholder_name,
      required final int expiration_month,
      required final int expiration_year,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$CreditImpl;

  factory _Credit.fromJson(Map<String, dynamic> json) = _$CreditImpl.fromJson;

  @override
  int get id;
  @override
  String get card_number;
  @override
  String get cardholder_name;
  @override
  int get expiration_month;
  @override
  int get expiration_year;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CreditImplCopyWith<_$CreditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
