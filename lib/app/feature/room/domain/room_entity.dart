import 'package:smart_home/app/feature/room/data/model/room_model.dart';
import 'package:smart_home/app/feature/room/enum/room_type.dart';

class RoomEntity {
  final String homeId;
  final String roomName;
  final int deviceCount;
  final int runningDeviceCount;
  final int createAt;
  final RoomType roomType;

  RoomEntity(
      {required this.homeId,
      required this.roomName,
      required this.deviceCount,
      required this.runningDeviceCount,
      required this.createAt,
      required this.roomType});

  factory RoomEntity.fromModel(RoomModel roomModel) => RoomEntity(
      homeId: roomModel.homeId,
      roomName: roomModel.roomName,
      deviceCount: roomModel.deviceCount,
      runningDeviceCount: roomModel.runningDeviceCount,
      createAt: roomModel.createAt,
      roomType: roomModel.roomType);

  RoomModel toModel() => RoomModel(
      homeId: homeId,
      roomName: roomName,
      deviceCount: deviceCount,
      runningDeviceCount: runningDeviceCount,
      createAt: createAt,
      roomType: roomType);
}
