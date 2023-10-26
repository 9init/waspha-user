// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MapCategories _$MapCategoriesFromJson(Map<String, dynamic> json) {
  return _MapCategories.fromJson(json);
}

/// @nodoc
mixin _$MapCategories {
  int get id => throw _privateConstructorUsedError;
  dynamic get name => throw _privateConstructorUsedError;
  bool get is_enabled => throw _privateConstructorUsedError;
  dynamic get slug => throw _privateConstructorUsedError;
  dynamic get image => throw _privateConstructorUsedError;
  dynamic get description => throw _privateConstructorUsedError;
  dynamic get parent_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapCategoriesCopyWith<MapCategories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapCategoriesCopyWith<$Res> {
  factory $MapCategoriesCopyWith(
          MapCategories value, $Res Function(MapCategories) then) =
      _$MapCategoriesCopyWithImpl<$Res, MapCategories>;
  @useResult
  $Res call(
      {int id,
      dynamic name,
      bool is_enabled,
      dynamic slug,
      dynamic image,
      dynamic description,
      dynamic parent_id});
}

/// @nodoc
class _$MapCategoriesCopyWithImpl<$Res, $Val extends MapCategories>
    implements $MapCategoriesCopyWith<$Res> {
  _$MapCategoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? is_enabled = null,
    Object? slug = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? parent_id = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      is_enabled: null == is_enabled
          ? _value.is_enabled
          : is_enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as dynamic,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      parent_id: freezed == parent_id
          ? _value.parent_id
          : parent_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapCategoriesCopyWith<$Res>
    implements $MapCategoriesCopyWith<$Res> {
  factory _$$_MapCategoriesCopyWith(
          _$_MapCategories value, $Res Function(_$_MapCategories) then) =
      __$$_MapCategoriesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      dynamic name,
      bool is_enabled,
      dynamic slug,
      dynamic image,
      dynamic description,
      dynamic parent_id});
}

/// @nodoc
class __$$_MapCategoriesCopyWithImpl<$Res>
    extends _$MapCategoriesCopyWithImpl<$Res, _$_MapCategories>
    implements _$$_MapCategoriesCopyWith<$Res> {
  __$$_MapCategoriesCopyWithImpl(
      _$_MapCategories _value, $Res Function(_$_MapCategories) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? is_enabled = null,
    Object? slug = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? parent_id = freezed,
  }) {
    return _then(_$_MapCategories(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      is_enabled: null == is_enabled
          ? _value.is_enabled
          : is_enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as dynamic,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      parent_id: freezed == parent_id
          ? _value.parent_id
          : parent_id // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MapCategories implements _MapCategories {
  const _$_MapCategories(
      {required this.id,
      this.name,
      required this.is_enabled,
      this.slug,
      this.image,
      this.description,
      this.parent_id});

  factory _$_MapCategories.fromJson(Map<String, dynamic> json) =>
      _$$_MapCategoriesFromJson(json);

  @override
  final int id;
  @override
  final dynamic name;
  @override
  final bool is_enabled;
  @override
  final dynamic slug;
  @override
  final dynamic image;
  @override
  final dynamic description;
  @override
  final dynamic parent_id;

  @override
  String toString() {
    return 'MapCategories(id: $id, name: $name, is_enabled: $is_enabled, slug: $slug, image: $image, description: $description, parent_id: $parent_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapCategories &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            (identical(other.is_enabled, is_enabled) ||
                other.is_enabled == is_enabled) &&
            const DeepCollectionEquality().equals(other.slug, slug) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.parent_id, parent_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(name),
      is_enabled,
      const DeepCollectionEquality().hash(slug),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(parent_id));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapCategoriesCopyWith<_$_MapCategories> get copyWith =>
      __$$_MapCategoriesCopyWithImpl<_$_MapCategories>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MapCategoriesToJson(
      this,
    );
  }
}

abstract class _MapCategories implements MapCategories {
  const factory _MapCategories(
      {required final int id,
      final dynamic name,
      required final bool is_enabled,
      final dynamic slug,
      final dynamic image,
      final dynamic description,
      final dynamic parent_id}) = _$_MapCategories;

  factory _MapCategories.fromJson(Map<String, dynamic> json) =
      _$_MapCategories.fromJson;

  @override
  int get id;
  @override
  dynamic get name;
  @override
  bool get is_enabled;
  @override
  dynamic get slug;
  @override
  dynamic get image;
  @override
  dynamic get description;
  @override
  dynamic get parent_id;
  @override
  @JsonKey(ignore: true)
  _$$_MapCategoriesCopyWith<_$_MapCategories> get copyWith =>
      throw _privateConstructorUsedError;
}
