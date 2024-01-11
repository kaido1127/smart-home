part of 'room_repository.dart';

class _RoomRepositoryImpl implements RoomRepository {
  final RoomRemoteDataSource _remoteDataSource;

  _RoomRepositoryImpl({required RoomRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<void> createRoom({required RoomEntity roomEntity}) async {
    try {
      _remoteDataSource.createRoom(roomModel: roomEntity.toModel());
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<RoomEntity>> getAllRoom({required String homeId}) {
    try {
      return _remoteDataSource.getAllRoom(homeId: homeId).map((list) =>
          list.map((roomModel) => RoomEntity.fromModel(roomModel)).toList());
    } on Exception catch (e) {
      return Stream.error(e);
    }
  }

  @override
  Future<void> removeRoom(
      {required String roomId}) async {
    _remoteDataSource.removeRoom(roomId: roomId);
  }

  @override
  Future<void> updateHome({required RoomEntity roomEntity}) {
    throw UnimplementedError();
  }
}
