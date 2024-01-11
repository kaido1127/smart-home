import 'package:smart_home/app/feature/room/data/data_source/room_remote_data_source.dart';
import 'package:smart_home/app/feature/room/domain/room_entity.dart';

part 'room_repository_impl.dart';

abstract interface class RoomRepository {
  Future<void> createRoom({required RoomEntity roomEntity});
  Future<void> removeRoom({required String roomId,required String homeId});
  Future<void> updateHome({required RoomEntity roomEntity});
  Stream<List<RoomEntity>> getAllRoom({required String homeId});

  factory RoomRepository.create(
          {required RoomRemoteDataSource remoteDataSource}) =>
      _RoomRepositoryImpl(remoteDataSource: remoteDataSource);
}
