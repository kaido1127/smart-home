// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as String,
      email: json['email'] as String,
      image: json['image'] as String?,
      isOnline: json['is_online'] as bool?,
      lastActive: json['last_active'] as int?,
      name: json['name'] as String,
      coin: json['coin'] as int,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'image': instance.image,
      'is_online': instance.isOnline,
      'last_active': instance.lastActive,
      'name': instance.name,
      'coin': instance.coin,
    };
