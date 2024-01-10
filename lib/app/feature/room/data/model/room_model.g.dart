// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      homeId: json['home_id'] as String,
      roomName: json['room_name'] as String,
      deviceCount: json['device_count'] as int,
      runningDeviceCount: json['running_device_count'] as int,
      createAt: json['create_at'] as int,
      roomType: $enumDecode(_$RoomTypeEnumMap, json['room_type']),
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'home_id': instance.homeId,
      'room_name': instance.roomName,
      'device_count': instance.deviceCount,
      'running_device_count': instance.runningDeviceCount,
      'create_at': instance.createAt,
      'room_type': _$RoomTypeEnumMap[instance.roomType]!,
    };

const _$RoomTypeEnumMap = {
  RoomType.bedroom: 'bedroom',
  RoomType.livingRoom: 'livingRoom',
  RoomType.diningRoom: 'diningRoom',
  RoomType.kitchen: 'kitchen',
  RoomType.bathroom: 'bathroom',
  RoomType.officeRoom: 'officeRoom',
  RoomType.guestRoom: 'guestRoom',
  RoomType.storageRoom: 'storageRoom',
  RoomType.garage: 'garage',
};
