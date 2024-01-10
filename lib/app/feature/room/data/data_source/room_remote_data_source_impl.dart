part of 'room_remote_data_source.dart';

class _RoomRemoteDataSourceImpl implements RoomRemoteDataSource {
  final FirebaseFirestore _firestore;

  _RoomRemoteDataSourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<void> createRoom({required RoomModel roomModel}) async {
    try {
      await _firestore
          .collection('home')
          .doc(roomModel.homeId)
          .collection('list_room')
          .doc(roomModel.createAt.toString())
          .set(roomModel.toJson());
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  @override
  Stream<List<RoomModel>> getAllRoom({required String homeId}) {
    try {
      return _firestore
          .collection('home')
          .doc(homeId)
          .collection('list_room')
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
    await _firestore
        .collection('home')
        .doc(homeId)
        .collection('list_room')
        .doc(roomId)
        .delete();
  }

  @override
  Future<void> updateHome({required RoomModel roomModel}) {
    // TODO: implement updateHome
    throw UnimplementedError();
  }
}
