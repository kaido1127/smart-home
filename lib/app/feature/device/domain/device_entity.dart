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
}

class BulbsEntity extends DeviceEntity {
  final double brightnessLv;
  BulbsEntity(
      {required super.roomId,
      required super.deviceName,
      required super.createAt,
      required super.isActive,
      required this.brightnessLv});
}

class FanEntity extends DeviceEntity {
  final double speedLv;

  FanEntity(
      {required super.roomId,
      required super.deviceName,
      required super.createAt,
      required super.isActive,
      required this.speedLv});
}

class TvEntity extends DeviceEntity {
  final int currentChannel;
  final double volumeLv;

  TvEntity(
      {required super.roomId,
      required super.deviceName,
      required super.createAt,
      required super.isActive,
      required this.currentChannel,
      required this.volumeLv});
}

class DoorEntity extends DeviceEntity {
  final bool isOpen;
  final bool isPause;

  DoorEntity(
      {required super.roomId,
      required super.deviceName,
      required super.createAt,
      required super.isActive,
      required this.isOpen,
      required this.isPause});
}

