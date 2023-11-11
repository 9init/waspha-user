// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'likes_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataLocation _$DataLocationFromJson(Map<String, dynamic> json) {
  return _DataLocation.fromJson(json);
}

/// @nodoc
mixin _$DataLocation {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  int? get user_id => throw _privateConstructorUsedError;
  set user_id(int? value) => throw _privateConstructorUsedError;
  String? get location_string => throw _privateConstructorUsedError;
  set location_string(String? value) => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  set location(Location? value) => throw _privateConstructorUsedError;
  String? get landmark => throw _privateConstructorUsedError;
  set landmark(String? value) => throw _privateConstructorUsedError;
  String? get location_type => throw _privateConstructorUsedError;
  set location_type(String? value) => throw _privateConstructorUsedError;
  int? get is_custom_phone => throw _privateConstructorUsedError;
  set is_custom_phone(int? value) => throw _privateConstructorUsedError;
  Phone? get phone => throw _privateConstructorUsedError;
  set phone(Phone? value) => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  set createdAt(String? value) => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  set updatedAt(String? value) => throw _privateConstructorUsedError;
  String? get deletedAt => throw _privateConstructorUsedError;
  set deletedAt(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataLocationCopyWith<DataLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataLocationCopyWith<$Res> {
  factory $DataLocationCopyWith(
          DataLocation value, $Res Function(DataLocation) then) =
      _$DataLocationCopyWithImpl<$Res, DataLocation>;
  @useResult
  $Res call(
      {int id,
      int? user_id,
      String? location_string,
      Location? location,
      String? landmark,
      String? location_type,
      int? is_custom_phone,
      Phone? phone,
      String? createdAt,
      String? updatedAt,
      String? deletedAt});

  $LocationCopyWith<$Res>? get location;
  $PhoneCopyWith<$Res>? get phone;
}

/// @nodoc
class _$DataLocationCopyWithImpl<$Res, $Val extends DataLocation>
    implements $DataLocationCopyWith<$Res> {
  _$DataLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user_id = freezed,
    Object? location_string = freezed,
    Object? location = freezed,
    Object? landmark = freezed,
    Object? location_type = freezed,
    Object? is_custom_phone = freezed,
    Object? phone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      location_string: freezed == location_string
          ? _value.location_string
          : location_string // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      location_type: freezed == location_type
          ? _value.location_type
          : location_type // ignore: cast_nullable_to_non_nullable
              as String?,
      is_custom_phone: freezed == is_custom_phone
          ? _value.is_custom_phone
          : is_custom_phone // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PhoneCopyWith<$Res>? get phone {
    if (_value.phone == null) {
      return null;
    }

    return $PhoneCopyWith<$Res>(_value.phone!, (value) {
      return _then(_value.copyWith(phone: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataLocationImplCopyWith<$Res>
    implements $DataLocationCopyWith<$Res> {
  factory _$$DataLocationImplCopyWith(
          _$DataLocationImpl value, $Res Function(_$DataLocationImpl) then) =
      __$$DataLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? user_id,
      String? location_string,
      Location? location,
      String? landmark,
      String? location_type,
      int? is_custom_phone,
      Phone? phone,
      String? createdAt,
      String? updatedAt,
      String? deletedAt});

  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $PhoneCopyWith<$Res>? get phone;
}

/// @nodoc
class __$$DataLocationImplCopyWithImpl<$Res>
    extends _$DataLocationCopyWithImpl<$Res, _$DataLocationImpl>
    implements _$$DataLocationImplCopyWith<$Res> {
  __$$DataLocationImplCopyWithImpl(
      _$DataLocationImpl _value, $Res Function(_$DataLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user_id = freezed,
    Object? location_string = freezed,
    Object? location = freezed,
    Object? landmark = freezed,
    Object? location_type = freezed,
    Object? is_custom_phone = freezed,
    Object? phone = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_$DataLocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      location_string: freezed == location_string
          ? _value.location_string
          : location_string // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      landmark: freezed == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      location_type: freezed == location_type
          ? _value.location_type
          : location_type // ignore: cast_nullable_to_non_nullable
              as String?,
      is_custom_phone: freezed == is_custom_phone
          ? _value.is_custom_phone
          : is_custom_phone // ignore: cast_nullable_to_non_nullable
              as int?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataLocationImpl implements _DataLocation {
  _$DataLocationImpl(
      {required this.id,
      this.user_id,
      this.location_string,
      this.location,
      this.landmark,
      this.location_type,
      this.is_custom_phone,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory _$DataLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataLocationImplFromJson(json);

  @override
  int id;
  @override
  int? user_id;
  @override
  String? location_string;
  @override
  Location? location;
  @override
  String? landmark;
  @override
  String? location_type;
  @override
  int? is_custom_phone;
  @override
  Phone? phone;
  @override
  String? createdAt;
  @override
  String? updatedAt;
  @override
  String? deletedAt;

  @override
  String toString() {
    return 'DataLocation(id: $id, user_id: $user_id, location_string: $location_string, location: $location, landmark: $landmark, location_type: $location_type, is_custom_phone: $is_custom_phone, phone: $phone, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataLocationImplCopyWith<_$DataLocationImpl> get copyWith =>
      __$$DataLocationImplCopyWithImpl<_$DataLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataLocationImplToJson(
      this,
    );
  }
}

abstract class _DataLocation implements DataLocation {
  factory _DataLocation(
      {required int id,
      int? user_id,
      String? location_string,
      Location? location,
      String? landmark,
      String? location_type,
      int? is_custom_phone,
      Phone? phone,
      String? createdAt,
      String? updatedAt,
      String? deletedAt}) = _$DataLocationImpl;

  factory _DataLocation.fromJson(Map<String, dynamic> json) =
      _$DataLocationImpl.fromJson;

  @override
  int get id;
  set id(int value);
  @override
  int? get user_id;
  set user_id(int? value);
  @override
  String? get location_string;
  set location_string(String? value);
  @override
  Location? get location;
  set location(Location? value);
  @override
  String? get landmark;
  set landmark(String? value);
  @override
  String? get location_type;
  set location_type(String? value);
  @override
  int? get is_custom_phone;
  set is_custom_phone(int? value);
  @override
  Phone? get phone;
  set phone(Phone? value);
  @override
  String? get createdAt;
  set createdAt(String? value);
  @override
  String? get updatedAt;
  set updatedAt(String? value);
  @override
  String? get deletedAt;
  set deletedAt(String? value);
  @override
  @JsonKey(ignore: true)
  _$$DataLocationImplCopyWith<_$DataLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  double? get x => throw _privateConstructorUsedError;
  double? get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call({double? x, double? y});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? x, double? y});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_$LocationImpl(
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl implements _Location {
  const _$LocationImpl({this.x, this.y});

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final double? x;
  @override
  final double? y;

  @override
  String toString() {
    return 'Location(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location({final double? x, final double? y}) = _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  double? get x;
  @override
  double? get y;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Phone _$PhoneFromJson(Map<String, dynamic> json) {
  return _Phone.fromJson(json);
}

/// @nodoc
mixin _$Phone {
  int? get number => throw _privateConstructorUsedError;
  int? get phonecode => throw _privateConstructorUsedError;
  String? get full_number => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneCopyWith<Phone> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneCopyWith<$Res> {
  factory $PhoneCopyWith(Phone value, $Res Function(Phone) then) =
      _$PhoneCopyWithImpl<$Res, Phone>;
  @useResult
  $Res call({int? number, int? phonecode, String? full_number});
}

/// @nodoc
class _$PhoneCopyWithImpl<$Res, $Val extends Phone>
    implements $PhoneCopyWith<$Res> {
  _$PhoneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? phonecode = freezed,
    Object? full_number = freezed,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      phonecode: freezed == phonecode
          ? _value.phonecode
          : phonecode // ignore: cast_nullable_to_non_nullable
              as int?,
      full_number: freezed == full_number
          ? _value.full_number
          : full_number // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneImplCopyWith<$Res> implements $PhoneCopyWith<$Res> {
  factory _$$PhoneImplCopyWith(
          _$PhoneImpl value, $Res Function(_$PhoneImpl) then) =
      __$$PhoneImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? number, int? phonecode, String? full_number});
}

/// @nodoc
class __$$PhoneImplCopyWithImpl<$Res>
    extends _$PhoneCopyWithImpl<$Res, _$PhoneImpl>
    implements _$$PhoneImplCopyWith<$Res> {
  __$$PhoneImplCopyWithImpl(
      _$PhoneImpl _value, $Res Function(_$PhoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? phonecode = freezed,
    Object? full_number = freezed,
  }) {
    return _then(_$PhoneImpl(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      phonecode: freezed == phonecode
          ? _value.phonecode
          : phonecode // ignore: cast_nullable_to_non_nullable
              as int?,
      full_number: freezed == full_number
          ? _value.full_number
          : full_number // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneImpl implements _Phone {
  const _$PhoneImpl({this.number, this.phonecode, this.full_number});

  factory _$PhoneImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhoneImplFromJson(json);

  @override
  final int? number;
  @override
  final int? phonecode;
  @override
  final String? full_number;

  @override
  String toString() {
    return 'Phone(number: $number, phonecode: $phonecode, full_number: $full_number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.phonecode, phonecode) ||
                other.phonecode == phonecode) &&
            (identical(other.full_number, full_number) ||
                other.full_number == full_number));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, number, phonecode, full_number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneImplCopyWith<_$PhoneImpl> get copyWith =>
      __$$PhoneImplCopyWithImpl<_$PhoneImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneImplToJson(
      this,
    );
  }
}

abstract class _Phone implements Phone {
  const factory _Phone(
      {final int? number,
      final int? phonecode,
      final String? full_number}) = _$PhoneImpl;

  factory _Phone.fromJson(Map<String, dynamic> json) = _$PhoneImpl.fromJson;

  @override
  int? get number;
  @override
  int? get phonecode;
  @override
  String? get full_number;
  @override
  @JsonKey(ignore: true)
  _$$PhoneImplCopyWith<_$PhoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
