// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Stores _$$_StoresFromJson(Map<String, dynamic> json) => _$_Stores(
      id: json['id'] as int,
      business_name: Map<String, String>.from(json['business_name'] as Map),
      ar: json['ar'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      timings: json['timings'],
      image: json['image'] as String,
      delivery: json['delivery'] as bool,
      pickup: json['pickup'] as bool,
      vendor_id: json['vendor_id'] as int,
      category_id: json['category_id'] as int,
      category_ids:
          (json['category_ids'] as List<dynamic>).map((e) => e as int).toList(),
      distance: (json['distance'] as num).toDouble(),
      average_rating: (json['average_rating'] as num).toDouble(),
      has_menu: json['has_menu'] as bool,
    );

Map<String, dynamic> _$$_StoresToJson(_$_Stores instance) => <String, dynamic>{
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
      'category_id': instance.category_id,
      'category_ids': instance.category_ids,
      'distance': instance.distance,
      'average_rating': instance.average_rating,
      'has_menu': instance.has_menu,
    };

_$_Categories _$$_CategoriesFromJson(Map<String, dynamic> json) =>
    _$_Categories(
      id: json['id'] as int,
      name: Map<String, String>.from(json['name'] as Map),
      slug: json['slug'] as String,
      image: json['image'] as String?,
      secondary_image: json['secondary_image'],
      sub_categories: (json['sub_categories'] as List<dynamic>)
          .map(SubCategories.fromJson)
          .toList(),
    );

Map<String, dynamic> _$$_CategoriesToJson(_$_Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'secondary_image': instance.secondary_image,
      'sub_categories': instance.sub_categories,
    };

_$_StoresData _$$_StoresDataFromJson(Map<String, dynamic> json) =>
    _$_StoresData(
      id: json['id'] as int,
      name: Map<String, String>.from(json['name'] as Map),
      slug: json['slug'] as String,
      image: json['image'] as String?,
      secondary_image: json['secondary_image'],
    );

Map<String, dynamic> _$$_StoresDataToJson(_$_StoresData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'secondary_image': instance.secondary_image,
    };
