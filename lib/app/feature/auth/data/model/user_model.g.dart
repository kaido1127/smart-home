// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      createdAt: json['created_at'] as int,
      email: json['email'] as String,
      id: json['id'] as String,
      image: json['image'] as String?,
      name: json['name'] as String,
      coin: json['coin'] as int,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'email': instance.email,
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'coin': instance.coin,
    };
