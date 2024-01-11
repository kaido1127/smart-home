part of 'device_repository.dart';

class _DeviceRepositoryImpl implements DeviceRepository {
  final DeviceRemoteDataSource _remoteDataSource;

  _DeviceRepositoryImpl({required DeviceRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;
  @override
  Future<void> createDevice({required DeviceEntity deviceEntity}) async {
    try {
      await _remoteDataSource.createDevice(deviceModel: deviceEntity.toModel());
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<DeviceEntity>> getDeviceOfRoom({required String roomId}) {
    try {
      return _remoteDataSource
          .getDeviceOfRoom(roomId: roomId)
          .map((list) => list.map((deviceModel) {
                switch (deviceModel.deviceType) {
                  case DeviceType.bulbs:
                    return BulbsEntity.fromModel(deviceModel);
                  case DeviceType.fan:
                    return FanEntity.fromModel(deviceModel);
                  case DeviceType.tv:
                    return TvEntity.fromModel(deviceModel);
                  case DeviceType.door:
                    return DoorEntity.fromModel(deviceModel);
                }
              }).toList());
    } on Exception catch (e) {
      return Stream.error(e);
    }
  }

  @override
  Future<void> removeDevice({required String deviceId}) async {
    try {
      await _remoteDataSource.removeDevice(deviceId: deviceId);
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateDevice({required DeviceEntity deviceEntity}) async {
    try {
      await _remoteDataSource.updateDevice(deviceModel: deviceEntity.toModel());
    } on Exception catch (e) {
      rethrow;
    }
  }
}
