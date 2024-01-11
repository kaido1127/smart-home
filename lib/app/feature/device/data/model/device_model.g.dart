// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => DeviceModel(
      roomId: json['room_id'] as String,
      deviceName: json['device_name'] as String,
      createAt: json['create_at'] as int,
      isActive: json['is_active'] as bool,
      deviceType: $enumDecode(_$DeviceTypeEnumMap, json['device_type']),
      brightnessLv: (json['brightness_lv'] as num?)?.toDouble(),
      speedLv: (json['speed_lv'] as num?)?.toDouble(),
      currentChannel: json['current_channel'] as int?,
      volumeLv: (json['volume_lv'] as num?)?.toDouble(),
      isOpen: json['is_open'] as bool?,
      isPause: json['is_pause'] as bool?,
    );

Map<String, dynamic> _$DeviceModelToJson(DeviceModel instance) =>
    <String, dynamic>{
      'room_id': instance.roomId,
      'device_name': instance.deviceName,
      'create_at': instance.createAt,
      'is_active': instance.isActive,
      'device_type': _$DeviceTypeEnumMap[instance.deviceType]!,
      'brightness_lv': instance.brightnessLv,
      'speed_lv': instance.speedLv,
      'current_channel': instance.currentChannel,
      'volume_lv': instance.volumeLv,
      'is_open': instance.isOpen,
      'is_pause': instance.isPause,
    };

const _$DeviceTypeEnumMap = {
  DeviceType.bulbs: 'bulbs',
  DeviceType.fan: 'fan',
  DeviceType.tv: 'tv',
  DeviceType.door: 'door',
};
