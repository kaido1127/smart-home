// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      hostId: json['host_id'] as String,
      homeName: json['home_name'] as String,
      roomCount: json['room_count'] as int,
      runningDeviceCount: json['running_device_count'] as int,
      createAt: json['create_at'] as int,
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'host_id': instance.hostId,
      'home_name': instance.homeName,
      'room_count': instance.roomCount,
      'running_device_count': instance.runningDeviceCount,
      'create_at': instance.createAt,
    };
