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
      _updateActiveDeviceCount(roomId: deviceModel.roomId);
      _updateDeviceCount(roomId: deviceModel.roomId);
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
  Future<void> removeDevice(
      {required String deviceId, required String roomId}) async {
    await _firestore.collection('device').doc(deviceId).delete();
    _updateActiveDeviceCount(roomId: roomId);
    _updateDeviceCount(roomId: roomId);
  }

  @override
  Future<void> updateDevice({required DeviceModel deviceModel}) async {
    await _firestore
        .collection('device')
        .doc(deviceModel.createAt.toString())
        .update(deviceModel.toJson());
    _updateActiveDeviceCount(roomId: deviceModel.roomId);
    _updateDeviceCount(roomId: deviceModel.roomId);
  }

  Future<void> _updateDeviceCount({required String roomId}) async {
    final int count = await _getDeviceCount(roomId: roomId);
    await _firestore
        .collection('room')
        .doc(roomId)
        .update({'device_count': count});
  }

  Future<void> _updateActiveDeviceCount({required String roomId}) async {
    final int count = await _getActiveDeviceCount(roomId: roomId);
    await _firestore
        .collection('room')
        .doc(roomId)
        .update({'running_device_count': count});
  }

  Future<int> _getActiveDeviceCount({required roomId}) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('device')
        .where('room_id', isEqualTo: roomId)
        .where('is_active', isEqualTo: true)
        .get();

    return querySnapshot.size;
  }

  Future<int> _getDeviceCount({required roomId}) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('device')
        .where('room_id', isEqualTo: roomId)
        .get();

    return querySnapshot.size;
  }
}
