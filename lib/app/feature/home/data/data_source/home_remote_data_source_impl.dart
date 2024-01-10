part of 'home_remote_data_source.dart';

class _HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore _firestore;

  _HomeRemoteDataSourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<void> createHome({required HomeModel homeModel}) async {
    try {
      await _firestore
          .collection('home')
          .doc(homeModel.createAt.toString())
          .set(homeModel.toJson());
    } on Exception catch (e) {
      throw 'Tạo nhà mới thất bại';
    }
  }

  @override
  Stream<List<HomeModel>> getAllHome({required String userID}) {
    try {
      _firestore.collection('home').get();
      return _firestore
          .collection('home')
          .where('host_id', isEqualTo: userID)
          .snapshots()
          .map((event) {
        return (event.docs.isEmpty)
            ? []
            : event.docs.map((e) {
                print("[HomeRemoteDataSource] ${e.data().toString()}");
                return HomeModel.fromJson(e.data());
              }).toList();
      });
    } on Exception catch (e) {
      print("StreamError");
      return const Stream.empty();
    }
  }

  @override
  Future<void> removeHome({required String homeId}) async {
    final listRoomOfHomeRef = await _firestore
        .collection('room')
        .where('home_id', isEqualTo: homeId)
        .get();
    for (var roomRef in listRoomOfHomeRef.docs) {
      await _firestore.collection('room').doc(roomRef.id).delete();
    }
    await _firestore.collection('home').doc(homeId).delete();
  }

  @override
  Future<void> updateHome({required HomeModel homeModel}) async {
    // TODO: implement updateHome
    throw UnimplementedError();
  }

  // Future<void> _collectionDelete(
  //     {required CollectionReference collectionRef}) async {
  //   WriteBatch batch = _firestore.batch();
  //   QuerySnapshot querySnapshot = await collectionRef.get();

  //   for (QueryDocumentSnapshot doc in querySnapshot.docs) {
  //     batch.delete(doc.reference);
  //   }

  //   await batch.commit();
  // }
}
