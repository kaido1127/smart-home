part of 'room_remote_data_source.dart';

class _RoomRemoteDataSourceImpl implements RoomRemoteDataSource {
  final FirebaseFirestore _firestore;

  _RoomRemoteDataSourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<void> createRoom({required RoomModel roomModel}) async {
    try {
      await _firestore
          .collection('room')
          .doc(roomModel.createAt.toString())
          .set(roomModel.toJson());
      _updateRoomCount(homeId: roomModel.homeId);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  @override
  Stream<List<RoomModel>> getAllRoom({required String homeId}) {
    try {
      return _firestore
          .collection('room')
          .where('home_id', isEqualTo: homeId)
          .snapshots()
          .map((listRoomRef) => listRoomRef.docs
              .map((roomRef) => RoomModel.fromJson(roomRef.data()))
              .toList());
    } on Exception catch (e) {
      return Stream.error(e);
    }
  }

  @override
  Future<void> removeRoom(
      {required String roomId, required String homeId}) async {
    await _firestore.collection('room').doc(roomId).delete();
    _updateRoomCount(homeId: homeId);
  }

  @override
  Future<void> updateHome({required RoomModel roomModel}) {
    // TODO: implement updateHome
    throw UnimplementedError();
  }

  Future<void> _updateRoomCount({required String homeId}) async {
    int count = await _getRoomCount(homeId: homeId);
    await _firestore
        .collection('home')
        .doc(homeId)
        .update({'room_count': count});
  }

  Future<int> _getRoomCount({required homeId}) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('room')
        .where('home_id', isEqualTo: homeId)
        .get();

    return querySnapshot.size;
  }
}
