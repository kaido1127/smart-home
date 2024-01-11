import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_home/app/feature/device/data/repository/device_repository_provider.dart';
import 'package:smart_home/app/feature/device/domain/device_entity.dart';
import 'package:smart_home/app/feature/device/enum/device_type.dart';

part 'device_controller.g.dart';

@riverpod
class DeviceController extends _$DeviceController {
  @override
  Stream<List<DeviceEntity>> build(String roomId) {
    return ref.watch(deviceRepositoryProvider).getDeviceOfRoom(roomId: roomId);
  }

  Future<void> createDevice(
      {required DeviceType deviceType, required String deviceName}) async {
    final int timeNow = DateTime.now().millisecondsSinceEpoch;
    late DeviceEntity newDevice;
    switch (deviceType) {
      case DeviceType.bulbs:
        newDevice = BulbsEntity(
            roomId: roomId,
            deviceName: deviceName,
            createAt: timeNow,
            isActive: false,
            brightnessLv: 0);
      case DeviceType.door:
        newDevice = DoorEntity(
            roomId: roomId,
            deviceName: deviceName,
            createAt: timeNow,
            isActive: false,
            isOpen: false,
            isPause: false);

      case DeviceType.fan:
        newDevice = FanEntity(
            roomId: roomId,
            deviceName: deviceName,
            createAt: timeNow,
            isActive: false,
            speedLv: 0);

      case DeviceType.tv:
        newDevice = TvEntity(
            roomId: roomId,
            deviceName: deviceName,
            createAt: timeNow,
            isActive: false,
            currentChannel: null,
            volumeLv: 0);
    }

    await ref
        .read(deviceRepositoryProvider)
        .createDevice(deviceEntity: newDevice);
  }

  Future<void> removeDevice({required String deviceId}) async {
    await ref.read(deviceRepositoryProvider).removeDevice(deviceId: deviceId);
  }

  Future<void> updateDevice({required DeviceEntity deviceEntity}) async {
    await ref
        .read(deviceRepositoryProvider)
        .updateDevice(deviceEntity: deviceEntity);
  }
}
