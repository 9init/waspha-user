// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buffer_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CancelReason _$CancelReasonFromJson(Map<String, dynamic> json) {
  return _CancelReason.fromJson(json);
}

/// @nodoc
mixin _$CancelReason {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  Value get value => throw _privateConstructorUsedError;
  set value(Value value) => throw _privateConstructorUsedError;
  bool get checked => throw _privateConstructorUsedError;
  set checked(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CancelReasonCopyWith<CancelReason> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelReasonCopyWith<$Res> {
  factory $CancelReasonCopyWith(
          CancelReason value, $Res Function(CancelReason) then) =
      _$CancelReasonCopyWithImpl<$Res, CancelReason>;
  @useResult
  $Res call({int id, Value value, bool checked});

  $ValueCopyWith<$Res> get value;
}

/// @nodoc
class _$CancelReasonCopyWithImpl<$Res, $Val extends CancelReason>
    implements $CancelReasonCopyWith<$Res> {
  _$CancelReasonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
    Object? checked = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Value,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ValueCopyWith<$Res> get value {
    return $ValueCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CancelReasonImplCopyWith<$Res>
    implements $CancelReasonCopyWith<$Res> {
  factory _$$CancelReasonImplCopyWith(
          _$CancelReasonImpl value, $Res Function(_$CancelReasonImpl) then) =
      __$$CancelReasonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Value value, bool checked});

  @override
  $ValueCopyWith<$Res> get value;
}

/// @nodoc
class __$$CancelReasonImplCopyWithImpl<$Res>
    extends _$CancelReasonCopyWithImpl<$Res, _$CancelReasonImpl>
    implements _$$CancelReasonImplCopyWith<$Res> {
  __$$CancelReasonImplCopyWithImpl(
      _$CancelReasonImpl _value, $Res Function(_$CancelReasonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? value = null,
    Object? checked = null,
  }) {
    return _then(_$CancelReasonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Value,
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelReasonImpl implements _CancelReason {
  _$CancelReasonImpl(
      {required this.id, required this.value, this.checked = false});

  factory _$CancelReasonImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelReasonImplFromJson(json);

  @override
  int id;
  @override
  Value value;
  @override
  @JsonKey()
  bool checked;

  @override
  String toString() {
    return 'CancelReason(id: $id, value: $value, checked: $checked)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelReasonImplCopyWith<_$CancelReasonImpl> get copyWith =>
      __$$CancelReasonImplCopyWithImpl<_$CancelReasonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelReasonImplToJson(
      this,
    );
  }
}

abstract class _CancelReason implements CancelReason {
  factory _CancelReason({required int id, required Value value, bool checked}) =
      _$CancelReasonImpl;

  factory _CancelReason.fromJson(Map<String, dynamic> json) =
      _$CancelReasonImpl.fromJson;

  @override
  int get id;
  set id(int value);
  @override
  Value get value;
  set value(Value value);
  @override
  bool get checked;
  set checked(bool value);
  @override
  @JsonKey(ignore: true)
  _$$CancelReasonImplCopyWith<_$CancelReasonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Value _$ValueFromJson(Map<String, dynamic> json) {
  return _Value.fromJson(json);
}

/// @nodoc
mixin _$Value {
  String get en => throw _privateConstructorUsedError;
  String get ar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValueCopyWith<Value> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueCopyWith<$Res> {
  factory $ValueCopyWith(Value value, $Res Function(Value) then) =
      _$ValueCopyWithImpl<$Res, Value>;
  @useResult
  $Res call({String en, String ar});
}

/// @nodoc
class _$ValueCopyWithImpl<$Res, $Val extends Value>
    implements $ValueCopyWith<$Res> {
  _$ValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = null,
    Object? ar = null,
  }) {
    return _then(_value.copyWith(
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
      ar: null == ar
          ? _value.ar
          : ar // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValueImplCopyWith<$Res> implements $ValueCopyWith<$Res> {
  factory _$$ValueImplCopyWith(
          _$ValueImpl value, $Res Function(_$ValueImpl) then) =
      __$$ValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String en, String ar});
}

/// @nodoc
class __$$ValueImplCopyWithImpl<$Res>
    extends _$ValueCopyWithImpl<$Res, _$ValueImpl>
    implements _$$ValueImplCopyWith<$Res> {
  __$$ValueImplCopyWithImpl(
      _$ValueImpl _value, $Res Function(_$ValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = null,
    Object? ar = null,
  }) {
    return _then(_$ValueImpl(
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as String,
      ar: null == ar
          ? _value.ar
          : ar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValueImpl implements _Value {
  _$ValueImpl({required this.en, required this.ar});

  factory _$ValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValueImplFromJson(json);

  @override
  final String en;
  @override
  final String ar;

  @override
  String toString() {
    return 'Value(en: $en, ar: $ar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValueImpl &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.ar, ar) || other.ar == ar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, en, ar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValueImplCopyWith<_$ValueImpl> get copyWith =>
      __$$ValueImplCopyWithImpl<_$ValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValueImplToJson(
      this,
    );
  }
}

abstract class _Value implements Value {
  factory _Value({required final String en, required final String ar}) =
      _$ValueImpl;

  factory _Value.fromJson(Map<String, dynamic> json) = _$ValueImpl.fromJson;

  @override
  String get en;
  @override
  String get ar;
  @override
  @JsonKey(ignore: true)
  _$$ValueImplCopyWith<_$ValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
