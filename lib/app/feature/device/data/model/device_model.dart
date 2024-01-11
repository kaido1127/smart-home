import 'package:json_annotation/json_annotation.dart';
import 'package:smart_home/app/feature/device/enum/device_type.dart';

part 'device_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DeviceModel {
  final String roomId;
  final String deviceName;
  final int createAt;
  final bool isActive;
  final DeviceType deviceType;

  //for bumbs
  final double? brightnessLv;

  //for fan
  final double? speedLv;

  //for tv
  final int? currentChannel;
  final double? volumeLv;
  //for door
  final bool? isOpen;
  final bool? isPause;

  DeviceModel(
      {required this.roomId,
      required this.deviceName,
      required this.createAt,
      required this.isActive,
      required this.deviceType,
      this.brightnessLv,
      this.speedLv,
      this.currentChannel,
      this.volumeLv,
      this.isOpen,
      this.isPause});

  factory DeviceModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceModelToJson(this);
}
