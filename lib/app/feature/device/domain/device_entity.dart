import 'package:smart_home/app/feature/device/data/model/device_model.dart';
import 'package:smart_home/app/feature/device/enum/device_type.dart';

sealed class DeviceEntity {
  final String roomId;
  final String deviceName;
  final int createAt;
  final bool isActive;

  DeviceEntity(
      {required this.roomId,
      required this.deviceName,
      required this.createAt,
      required this.isActive});

  DeviceModel toModel();
}

class BulbsEntity extends DeviceEntity {
  final double brightnessLv;
  BulbsEntity(
      {required super.roomId,
      required super.deviceName,
      required super.createAt,
      required super.isActive,
      required this.brightnessLv});
  factory BulbsEntity.fromModel(DeviceModel deviceModel) => BulbsEntity(
      roomId: deviceModel.roomId,
      deviceName: deviceModel.deviceName,
      createAt: deviceModel.createAt,
      isActive: deviceModel.isActive,
      brightnessLv: deviceModel.brightnessLv ?? 0);

  @override
  DeviceModel toModel() => DeviceModel(
      roomId: roomId,
      deviceName: deviceName,
      createAt: createAt,
      isActive: isActive,
      deviceType: DeviceType.bulbs,
      brightnessLv: brightnessLv);

  BulbsEntity copyWith({
    String? roomId,
    String? deviceName,
    int? createAt,
    bool? isActive,
    double? brightnessLv,
  }) {
    return BulbsEntity(
      roomId: roomId ?? this.roomId,
      deviceName: deviceName ?? this.deviceName,
      createAt: createAt ?? this.createAt,
      isActive: isActive ?? this.isActive,
      brightnessLv: brightnessLv ?? this.brightnessLv,
    );
  }
}

class FanEntity extends DeviceEntity {
  final double speedLv;

  FanEntity(
      {required super.roomId,
      required super.deviceName,
      required super.createAt,
      required super.isActive,
      required this.speedLv});

  factory FanEntity.fromModel(DeviceModel deviceModel) => FanEntity(
      roomId: deviceModel.roomId,
      deviceName: deviceModel.deviceName,
      createAt: deviceModel.createAt,
      isActive: deviceModel.isActive,
      speedLv: deviceModel.speedLv ?? 0);

  @override
  DeviceModel toModel() => DeviceModel(
      roomId: roomId,
      deviceName: deviceName,
      createAt: createAt,
      isActive: isActive,
      deviceType: DeviceType.fan,
      speedLv: speedLv);
  FanEntity copyWith({
    String? roomId,
    String? deviceName,
    int? createAt,
    bool? isActive,
    double? speedLv,
  }) {
    return FanEntity(
      roomId: roomId ?? this.roomId,
      deviceName: deviceName ?? this.deviceName,
      createAt: createAt ?? this.createAt,
      isActive: isActive ?? this.isActive,
      speedLv: speedLv ?? this.speedLv,
    );
  }
}

class TvEntity extends DeviceEntity {
  final int? currentChannel;
  final double volumeLv;

  TvEntity(
      {required super.roomId,
      required super.deviceName,
      required super.createAt,
      required super.isActive,
      required this.currentChannel,
      required this.volumeLv});
  factory TvEntity.fromModel(DeviceModel deviceModel) => TvEntity(
      roomId: deviceModel.roomId,
      deviceName: deviceModel.deviceName,
      createAt: deviceModel.createAt,
      isActive: deviceModel.isActive,
      currentChannel: deviceModel.currentChannel,
      volumeLv: deviceModel.volumeLv ?? 0);

  @override
  DeviceModel toModel() => DeviceModel(
      roomId: roomId,
      deviceName: deviceName,
      createAt: createAt,
      isActive: isActive,
      currentChannel: currentChannel,
      deviceType: DeviceType.tv,
      volumeLv: volumeLv);
  TvEntity copyWith({
    String? roomId,
    String? deviceName,
    int? createAt,
    bool? isActive,
    int? currentChannel,
    double? volumeLv,
  }) {
    return TvEntity(
      roomId: roomId ?? this.roomId,
      deviceName: deviceName ?? this.deviceName,
      createAt: createAt ?? this.createAt,
      isActive: isActive ?? this.isActive,
      currentChannel: currentChannel ?? this.currentChannel,
      volumeLv: volumeLv ?? this.volumeLv,
    );
  }
}

class DoorEntity extends DeviceEntity {
  final bool isOpen;
  final bool? isPause;

  DoorEntity(
      {required super.roomId,
      required super.deviceName,
      required super.createAt,
      required super.isActive,
      required this.isOpen,
      required this.isPause});

  factory DoorEntity.fromModel(DeviceModel deviceModel) => DoorEntity(
      roomId: deviceModel.roomId,
      deviceName: deviceModel.deviceName,
      createAt: deviceModel.createAt,
      isActive: deviceModel.isActive,
      isOpen: deviceModel.isOpen ?? false,
      isPause: deviceModel.isPause);

  @override
  DeviceModel toModel() => DeviceModel(
      roomId: roomId,
      deviceName: deviceName,
      createAt: createAt,
      isActive: isActive,
      isOpen: isOpen,
      deviceType: DeviceType.door,
      isPause: isPause);
  DoorEntity copyWith({
    String? roomId,
    String? deviceName,
    int? createAt,
    bool? isActive,
    bool? isOpen,
    bool? isPause,
  }) {
    return DoorEntity(
      roomId: roomId ?? this.roomId,
      deviceName: deviceName ?? this.deviceName,
      createAt: createAt ?? this.createAt,
      isActive: isActive ?? this.isActive,
      isOpen: isOpen ?? this.isOpen,
      isPause: isPause,
    );
  }
}
