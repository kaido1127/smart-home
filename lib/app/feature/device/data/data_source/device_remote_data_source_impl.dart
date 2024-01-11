part of 'device_remote_data_source.dart';

class _DeviceRemoteDataSourceImpl implements DeviceRemoteDataSource {
  final FirebaseFirestore _firestore;

  _DeviceRemoteDataSourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;
  @override
  Future<void> createDevice({required DeviceModel deviceModel}) async {
    try {
      await _firestore
          .collection('device')
          .doc(deviceModel.createAt.toString())
          .set(deviceModel.toJson());
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<DeviceModel>> getDeviceOfRoom({required String roomId}) {
    try {
      return _firestore
          .collection('device')
          .where('room_id', isEqualTo: roomId)
          .snapshots()
          .map((listRef) => listRef.docs
              .map((deviceRef) => DeviceModel.fromJson(deviceRef.data()))
              .toList());
    } on Exception catch (e) {
      return Stream.error(e);
    }
  }

  @override
  Future<void> removeDevice({required String deviceId}) async {
    await _firestore.collection('device').doc(deviceId).delete();
  }

  @override
  Future<void> updateDevice({required DeviceModel deviceModel}) async {
    await _firestore
        .collection('device')
        .doc(deviceModel.createAt.toString())
        .update(deviceModel.toJson());
  }
}
