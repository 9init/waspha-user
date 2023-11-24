// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rfp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RfpModel _$RfpModelFromJson(Map<String, dynamic> json) {
  return _RfpModel.fromJson(json);
}

/// @nodoc
mixin _$RfpModel {
  int get id => throw _privateConstructorUsedError;
  DateTime get order_date => throw _privateConstructorUsedError;
  DateTime get expiry_time => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get total_proposals => throw _privateConstructorUsedError;
  String get rfp_status => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  CategoryModel get category => throw _privateConstructorUsedError;
  List<StoreModel> get stores => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RfpModelCopyWith<RfpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RfpModelCopyWith<$Res> {
  factory $RfpModelCopyWith(RfpModel value, $Res Function(RfpModel) then) =
      _$RfpModelCopyWithImpl<$Res, RfpModel>;
  @useResult
  $Res call(
      {int id,
      DateTime order_date,
      DateTime expiry_time,
      String type,
      int total_proposals,
      String rfp_status,
      String status,
      CategoryModel category,
      List<StoreModel> stores});

  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class _$RfpModelCopyWithImpl<$Res, $Val extends RfpModel>
    implements $RfpModelCopyWith<$Res> {
  _$RfpModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? order_date = null,
    Object? expiry_time = null,
    Object? type = null,
    Object? total_proposals = null,
    Object? rfp_status = null,
    Object? status = null,
    Object? category = null,
    Object? stores = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      order_date: null == order_date
          ? _value.order_date
          : order_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiry_time: null == expiry_time
          ? _value.expiry_time
          : expiry_time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      total_proposals: null == total_proposals
          ? _value.total_proposals
          : total_proposals // ignore: cast_nullable_to_non_nullable
              as int,
      rfp_status: null == rfp_status
          ? _value.rfp_status
          : rfp_status // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      stores: null == stores
          ? _value.stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<StoreModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res> get category {
    return $CategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RfpModelImplCopyWith<$Res>
    implements $RfpModelCopyWith<$Res> {
  factory _$$RfpModelImplCopyWith(
          _$RfpModelImpl value, $Res Function(_$RfpModelImpl) then) =
      __$$RfpModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime order_date,
      DateTime expiry_time,
      String type,
      int total_proposals,
      String rfp_status,
      String status,
      CategoryModel category,
      List<StoreModel> stores});

  @override
  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$$RfpModelImplCopyWithImpl<$Res>
    extends _$RfpModelCopyWithImpl<$Res, _$RfpModelImpl>
    implements _$$RfpModelImplCopyWith<$Res> {
  __$$RfpModelImplCopyWithImpl(
      _$RfpModelImpl _value, $Res Function(_$RfpModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? order_date = null,
    Object? expiry_time = null,
    Object? type = null,
    Object? total_proposals = null,
    Object? rfp_status = null,
    Object? status = null,
    Object? category = null,
    Object? stores = null,
  }) {
    return _then(_$RfpModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      order_date: null == order_date
          ? _value.order_date
          : order_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiry_time: null == expiry_time
          ? _value.expiry_time
          : expiry_time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      total_proposals: null == total_proposals
          ? _value.total_proposals
          : total_proposals // ignore: cast_nullable_to_non_nullable
              as int,
      rfp_status: null == rfp_status
          ? _value.rfp_status
          : rfp_status // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      stores: null == stores
          ? _value._stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<StoreModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RfpModelImpl implements _RfpModel {
  const _$RfpModelImpl(
      {required this.id,
      required this.order_date,
      required this.expiry_time,
      required this.type,
      required this.total_proposals,
      required this.rfp_status,
      required this.status,
      required this.category,
      required final List<StoreModel> stores})
      : _stores = stores;

  factory _$RfpModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RfpModelImplFromJson(json);

  @override
  final int id;
  @override
  final DateTime order_date;
  @override
  final DateTime expiry_time;
  @override
  final String type;
  @override
  final int total_proposals;
  @override
  final String rfp_status;
  @override
  final String status;
  @override
  final CategoryModel category;
  final List<StoreModel> _stores;
  @override
  List<StoreModel> get stores {
    if (_stores is EqualUnmodifiableListView) return _stores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stores);
  }

  @override
  String toString() {
    return 'RfpModel(id: $id, order_date: $order_date, expiry_time: $expiry_time, type: $type, total_proposals: $total_proposals, rfp_status: $rfp_status, status: $status, category: $category, stores: $stores)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RfpModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.order_date, order_date) ||
                other.order_date == order_date) &&
            (identical(other.expiry_time, expiry_time) ||
                other.expiry_time == expiry_time) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.total_proposals, total_proposals) ||
                other.total_proposals == total_proposals) &&
            (identical(other.rfp_status, rfp_status) ||
                other.rfp_status == rfp_status) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._stores, _stores));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      order_date,
      expiry_time,
      type,
      total_proposals,
      rfp_status,
      status,
      category,
      const DeepCollectionEquality().hash(_stores));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RfpModelImplCopyWith<_$RfpModelImpl> get copyWith =>
      __$$RfpModelImplCopyWithImpl<_$RfpModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RfpModelImplToJson(
      this,
    );
  }
}

abstract class _RfpModel implements RfpModel {
  const factory _RfpModel(
      {required final int id,
      required final DateTime order_date,
      required final DateTime expiry_time,
      required final String type,
      required final int total_proposals,
      required final String rfp_status,
      required final String status,
      required final CategoryModel category,
      required final List<StoreModel> stores}) = _$RfpModelImpl;

  factory _RfpModel.fromJson(Map<String, dynamic> json) =
      _$RfpModelImpl.fromJson;

  @override
  int get id;
  @override
  DateTime get order_date;
  @override
  DateTime get expiry_time;
  @override
  String get type;
  @override
  int get total_proposals;
  @override
  String get rfp_status;
  @override
  String get status;
  @override
  CategoryModel get category;
  @override
  List<StoreModel> get stores;
  @override
  @JsonKey(ignore: true)
  _$$RfpModelImplCopyWith<_$RfpModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  int get id => throw _privateConstructorUsedError;
  Map<String, String> get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call({int id, Map<String, String> name, String image});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Map<String, String> name, String image});
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_$CategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value._name
          : name // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl(
      {required this.id,
      required final Map<String, String> name,
      required this.image})
      : _name = name;

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final int id;
  final Map<String, String> _name;
  @override
  Map<String, String> get name {
    if (_name is EqualUnmodifiableMapView) return _name;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_name);
  }

  @override
  final String image;

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._name, _name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_name), image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel(
      {required final int id,
      required final Map<String, String> name,
      required final String image}) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  Map<String, String> get name;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) {
  return _StoreModel.fromJson(json);
}

/// @nodoc
mixin _$StoreModel {
  String get name => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreModelCopyWith<StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreModelCopyWith<$Res> {
  factory $StoreModelCopyWith(
          StoreModel value, $Res Function(StoreModel) then) =
      _$StoreModelCopyWithImpl<$Res, StoreModel>;
  @useResult
  $Res call({String name, int id, String image});
}

/// @nodoc
class _$StoreModelCopyWithImpl<$Res, $Val extends StoreModel>
    implements $StoreModelCopyWith<$Res> {
  _$StoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreModelImplCopyWith<$Res>
    implements $StoreModelCopyWith<$Res> {
  factory _$$StoreModelImplCopyWith(
          _$StoreModelImpl value, $Res Function(_$StoreModelImpl) then) =
      __$$StoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int id, String image});
}

/// @nodoc
class __$$StoreModelImplCopyWithImpl<$Res>
    extends _$StoreModelCopyWithImpl<$Res, _$StoreModelImpl>
    implements _$$StoreModelImplCopyWith<$Res> {
  __$$StoreModelImplCopyWithImpl(
      _$StoreModelImpl _value, $Res Function(_$StoreModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? image = null,
  }) {
    return _then(_$StoreModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreModelImpl implements _StoreModel {
  const _$StoreModelImpl(
      {required this.name, required this.id, required this.image});

  factory _$StoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreModelImplFromJson(json);

  @override
  final String name;
  @override
  final int id;
  @override
  final String image;

  @override
  String toString() {
    return 'StoreModel(name: $name, id: $id, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreModelImplCopyWith<_$StoreModelImpl> get copyWith =>
      __$$StoreModelImplCopyWithImpl<_$StoreModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreModelImplToJson(
      this,
    );
  }
}

abstract class _StoreModel implements StoreModel {
  const factory _StoreModel(
      {required final String name,
      required final int id,
      required final String image}) = _$StoreModelImpl;

  factory _StoreModel.fromJson(Map<String, dynamic> json) =
      _$StoreModelImpl.fromJson;

  @override
  String get name;
  @override
  int get id;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$StoreModelImplCopyWith<_$StoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
