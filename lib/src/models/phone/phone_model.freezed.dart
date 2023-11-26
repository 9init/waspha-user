// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PhoneModel _$PhoneModelFromJson(Map<String, dynamic> json) {
  return _PhoneModel.fromJson(json);
}

/// @nodoc
mixin _$PhoneModel {
  @JsonKey(name: 'country_code')
  int get countryCode => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneModelCopyWith<PhoneModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneModelCopyWith<$Res> {
  factory $PhoneModelCopyWith(
          PhoneModel value, $Res Function(PhoneModel) then) =
      _$PhoneModelCopyWithImpl<$Res, PhoneModel>;
  @useResult
  $Res call({@JsonKey(name: 'country_code') int countryCode, int number});
}

/// @nodoc
class _$PhoneModelCopyWithImpl<$Res, $Val extends PhoneModel>
    implements $PhoneModelCopyWith<$Res> {
  _$PhoneModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = null,
    Object? number = null,
  }) {
    return _then(_value.copyWith(
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneModelImplCopyWith<$Res>
    implements $PhoneModelCopyWith<$Res> {
  factory _$$PhoneModelImplCopyWith(
          _$PhoneModelImpl value, $Res Function(_$PhoneModelImpl) then) =
      __$$PhoneModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'country_code') int countryCode, int number});
}

/// @nodoc
class __$$PhoneModelImplCopyWithImpl<$Res>
    extends _$PhoneModelCopyWithImpl<$Res, _$PhoneModelImpl>
    implements _$$PhoneModelImplCopyWith<$Res> {
  __$$PhoneModelImplCopyWithImpl(
      _$PhoneModelImpl _value, $Res Function(_$PhoneModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = null,
    Object? number = null,
  }) {
    return _then(_$PhoneModelImpl(
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneModelImpl extends _PhoneModel {
  const _$PhoneModelImpl(
      {@JsonKey(name: 'country_code') required this.countryCode,
      required this.number})
      : super._();

  factory _$PhoneModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhoneModelImplFromJson(json);

  @override
  @JsonKey(name: 'country_code')
  final int countryCode;
  @override
  final int number;

  @override
  String toString() {
    return 'PhoneModel(countryCode: $countryCode, number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneModelImpl &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.number, number) || other.number == number));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, countryCode, number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneModelImplCopyWith<_$PhoneModelImpl> get copyWith =>
      __$$PhoneModelImplCopyWithImpl<_$PhoneModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneModelImplToJson(
      this,
    );
  }
}

abstract class _PhoneModel extends PhoneModel {
  const factory _PhoneModel(
      {@JsonKey(name: 'country_code') required final int countryCode,
      required final int number}) = _$PhoneModelImpl;
  const _PhoneModel._() : super._();

  factory _PhoneModel.fromJson(Map<String, dynamic> json) =
      _$PhoneModelImpl.fromJson;

  @override
  @JsonKey(name: 'country_code')
  int get countryCode;
  @override
  int get number;
  @override
  @JsonKey(ignore: true)
  _$$PhoneModelImplCopyWith<_$PhoneModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
