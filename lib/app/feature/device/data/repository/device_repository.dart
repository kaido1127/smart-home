import 'package:flutter/material.dart';
import 'package:smart_home/app/feature/device/data/data_source/device_remote_data_source.dart';
import 'package:smart_home/app/feature/device/domain/device_entity.dart';
import 'package:smart_home/app/feature/device/enum/device_type.dart';

part 'device_repository_impl.dart';

abstract class DeviceRepository {
  Future<void> createDevice({required DeviceEntity deviceEntity});
  Future<void> removeDevice({required String deviceId});
  Future<void> updateDevice({required DeviceEntity deviceEntity});
  Stream<List<DeviceEntity>> getDeviceOfRoom({required String roomId});

  factory DeviceRepository.create(
          {required DeviceRemoteDataSource remoteDataSource}) =>
      _DeviceRepositoryImpl(remoteDataSource: remoteDataSource);
}
