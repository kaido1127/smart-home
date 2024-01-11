import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_home/app/feature/device/data/model/device_model.dart';

part 'device_remote_data_source_impl.dart';

abstract interface class DeviceRemoteDataSource {
  Future<void> createDevice({required DeviceModel deviceModel});
  Future<void> removeDevice({required String deviceId});
  Future<void> updateDevice({required DeviceModel deviceModel});
  Stream<List<DeviceModel>> getDeviceOfRoom({required String roomId});

  factory DeviceRemoteDataSource.create(
          {required FirebaseFirestore firestore}) =>
      _DeviceRemoteDataSourceImpl(firestore: firestore);
}
