import 'package:json_annotation/json_annotation.dart';
import 'package:smart_home/app/feature/room/enum/room_type.dart';

part 'room_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RoomModel {
  final String homeId;
  final String roomName;
  final int deviceCount;
  final int runningDeviceCount;
  final int createAt;
  final RoomType roomType;

  

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  RoomModel({required this.homeId, required this.roomName, required this.deviceCount, required this.runningDeviceCount, required this.createAt, required this.roomType});

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}
