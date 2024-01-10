import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_home/app/feature/home/data/model/home_model.dart';
import 'package:smart_home/app/feature/room/data/model/room_model.dart';

part 'room_remote_data_source_impl.dart';

abstract interface class RoomRemoteDataSource {
  Future<void> createRoom({required RoomModel roomModel});
  Future<void> removeRoom({required String roomId,required String homeId});
  Future<void> updateHome({required RoomModel roomModel});
  Stream<List<RoomModel>> getAllRoom({required String homeId});

  factory RoomRemoteDataSource.create({required FirebaseFirestore firestore}) =>
      _RoomRemoteDataSourceImpl(firestore: firestore);
}
