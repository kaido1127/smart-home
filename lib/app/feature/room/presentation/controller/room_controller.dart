import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_home/app/feature/room/data/repository/room_repository_provider.dart';
import 'package:smart_home/app/feature/room/domain/room_entity.dart';
import 'package:smart_home/app/feature/room/enum/room_type.dart';

part 'room_controller.g.dart';

@riverpod
class RoomController extends _$RoomController {
  @override
  Stream<List<RoomEntity>> build(String homeId) {
    return ref.watch(roomRepositoryProvider).getAllRoom(homeId: homeId);
  }

  Future<void> createRoom(
      {required String roomName, required RoomType roomType}) async {
    try {
      ref.read(roomRepositoryProvider).createRoom(
          roomEntity: RoomEntity(
              homeId: homeId,
              roomName: roomName,
              deviceCount: 0,
              runningDeviceCount: 0,
              createAt: DateTime.now().millisecondsSinceEpoch,
              roomType: roomType));
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<void> removeRoom({required String roomId}) async {
    ref.read(roomRepositoryProvider).removeRoom(roomId: roomId);
  }
}
