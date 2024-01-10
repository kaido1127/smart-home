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
      _increaseRoomCount(homeId: roomModel.homeId);
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
    _decreaseRoomCount(homeId: homeId);
  }

  @override
  Future<void> updateHome({required RoomModel roomModel}) {
    // TODO: implement updateHome
    throw UnimplementedError();
  }

  Future<void> _increaseRoomCount({required String homeId}) async {
    final homeRef = await _firestore.collection('home').doc(homeId).get();
    if (homeRef.exists && homeRef.data() != null) {
      final HomeModel homeModel = HomeModel.fromJson(homeRef.data()!);
      await _firestore
          .collection('home')
          .doc(homeId)
          .update({'room_count': homeModel.roomCount + 1});
    }
  }

  Future<void> _decreaseRoomCount({required String homeId}) async {
    final homeRef = await _firestore.collection('home').doc(homeId).get();
    if (homeRef.exists && homeRef.data() != null) {
      final HomeModel homeModel = HomeModel.fromJson(homeRef.data()!);
      await _firestore
          .collection('home')
          .doc(homeId)
          .update({'room_count': homeModel.roomCount - 1});
    }
  }
}
