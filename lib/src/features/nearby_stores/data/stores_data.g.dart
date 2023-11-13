// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoresImpl _$$StoresImplFromJson(Map<String, dynamic> json) => _$StoresImpl(
      id: json['id'] as int,
      business_name: (json['business_name'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      ar: json['ar'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      timings: json['timings'],
      image: json['image'] as String?,
      delivery: json['delivery'] as bool?,
      pickup: json['pickup'] as bool?,
      vendor_id: json['vendor_id'] as int?,
      is_favorite: json['is_favorite'] as bool?,
      category_id: json['category_id'] as int?,
      address: json['address'] as String?,
      category_ids: (json['category_ids'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      distance: (json['distance'] as num?)?.toDouble(),
      average_rating: (json['average_rating'] as num?)?.toDouble(),
      has_menu: json['has_menu'] as bool?,
    );

Map<String, dynamic> _$$StoresImplToJson(_$StoresImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'business_name': instance.business_name,
      'ar': instance.ar,
      'lat': instance.lat,
      'lng': instance.lng,
      'timings': instance.timings,
      'image': instance.image,
      'delivery': instance.delivery,
      'pickup': instance.pickup,
      'vendor_id': instance.vendor_id,
      'is_favorite': instance.is_favorite,
      'category_id': instance.category_id,
      'address': instance.address,
      'category_ids': instance.category_ids,
      'distance': instance.distance,
      'average_rating': instance.average_rating,
      'has_menu': instance.has_menu,
    };

_$CategoriesImpl _$$CategoriesImplFromJson(Map<String, dynamic> json) =>
    _$CategoriesImpl(
      id: json['id'] as int,
      name: (json['name'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      secondary_image: json['secondary_image'],
      sub_categories: (json['sub_categories'] as List<dynamic>?)
          ?.map(SubCategories.fromJson)
          .toList(),
    );

Map<String, dynamic> _$$CategoriesImplToJson(_$CategoriesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'secondary_image': instance.secondary_image,
      'sub_categories': instance.sub_categories,
    };

_$StoresDataImpl _$$StoresDataImplFromJson(Map<String, dynamic> json) =>
    _$StoresDataImpl(
      id: json['id'] as int,
      name: Map<String, String>.from(json['name'] as Map),
      slug: json['slug'] as String,
      image: json['image'] as String?,
      secondary_image: json['secondary_image'],
    );

Map<String, dynamic> _$$StoresDataImplToJson(_$StoresDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'secondary_image': instance.secondary_image,
    };

_$StoreCategoryImpl _$$StoreCategoryImplFromJson(Map<String, dynamic> json) =>
    _$StoreCategoryImpl(
      id: json['id'] as int,
      name: json['name'],
      is_enabled: json['is_enabled'] as bool,
      slug: json['slug'] as String?,
      image: json['image'],
      description: json['description'],
      parent_id: json['parent_id'],
    );

Map<String, dynamic> _$$StoreCategoryImplToJson(_$StoreCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_enabled': instance.is_enabled,
      'slug': instance.slug,
      'image': instance.image,
      'description': instance.description,
      'parent_id': instance.parent_id,
    };
