// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PetModel _$PetModelFromJson(Map<String, dynamic> json) => _PetModel(
  id: json['id'] as String,
  name: json['name'] as String,
  category: json['category'] as String,
  breed: json['breed'] as String,
  age: (json['age'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  isFavorite: json['isFavorite'] as bool? ?? false,
);

Map<String, dynamic> _$PetModelToJson(_PetModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': instance.category,
  'breed': instance.breed,
  'age': instance.age,
  'imageUrl': instance.imageUrl,
  'createdAt': instance.createdAt?.toIso8601String(),
  'isFavorite': instance.isFavorite,
};
