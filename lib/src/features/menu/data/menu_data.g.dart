// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MapCategories _$$_MapCategoriesFromJson(Map<String, dynamic> json) =>
    _$_MapCategories(
      id: json['id'] as int,
      name: json['name'],
      is_enabled: json['is_enabled'] as bool,
      slug: json['slug'],
      image: json['image'],
      description: json['description'],
      parent_id: json['parent_id'],
    );

Map<String, dynamic> _$$_MapCategoriesToJson(_$_MapCategories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_enabled': instance.is_enabled,
      'slug': instance.slug,
      'image': instance.image,
      'description': instance.description,
      'parent_id': instance.parent_id,
    };
