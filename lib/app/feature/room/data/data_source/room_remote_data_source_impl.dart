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
      _increaseRoomCount(roomId: roomModel.createAt.toString());
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
      {required String roomId}) async {
    await _firestore.collection('room').doc(roomId).delete();
    _decreaseRoomCount(roomId: roomId);
  }

  @override
  Future<void> updateHome({required RoomModel roomModel}) {
    // TODO: implement updateHome
    throw UnimplementedError();
  }

  Future<void> _increaseRoomCount({required String roomId}) async {
   final roomRef = await _firestore.collection('room').doc(roomId).get();
    if (roomRef.exists && roomRef.data() != null) {
      final RoomModel roomModel = RoomModel.fromJson(roomRef.data()!);
      final homeRef =
          await _firestore.collection('home').doc(roomModel.homeId).get();
      if (homeRef.exists && homeRef.data() != null) {
        final HomeModel homeModel = HomeModel.fromJson(homeRef.data()!);
        await _firestore
            .collection('home')
            .doc(homeModel.createAt.toString())
            .update({'room_count': homeModel.roomCount + 1});
      }
    }
  }

  Future<void> _decreaseRoomCount({required String roomId}) async {
    final roomRef = await _firestore.collection('room').doc(roomId).get();
    if (roomRef.exists && roomRef.data() != null) {
      final RoomModel roomModel = RoomModel.fromJson(roomRef.data()!);
      final homeRef =
          await _firestore.collection('home').doc(roomModel.homeId).get();
      if (homeRef.exists && homeRef.data() != null) {
        final HomeModel homeModel = HomeModel.fromJson(homeRef.data()!);
        await _firestore
            .collection('home')
            .doc(homeModel.createAt.toString())
            .update({'room_count': homeModel.roomCount - 1});
      }
    }
  }
}
