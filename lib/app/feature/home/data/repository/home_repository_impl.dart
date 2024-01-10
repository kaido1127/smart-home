part of 'home_repository.dart';

class _HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  _HomeRepositoryImpl({required HomeRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<void> createHome({required HomeEntity homeEntity}) async {
    try {
      _remoteDataSource.createHome(homeModel: homeEntity.toModel());
    } on Exception catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<HomeEntity>> getAllHome({required String userID}) {
    try {
      print('[HomeRepository] run');
      return _remoteDataSource
          .getAllHome(userID: userID)
          .map((listHome) => listHome.map((homeEnity) {
                print('[HomeRepository] ${homeEnity.toJson().toString()}');

                return HomeEntity.fromModel(homeEnity);
              }).toList());
    } on Exception catch (e) {
      throw 'Lấy danh sách nhà thất bại';
    }
  }

  @override
  Future<void> removeHome({required String homeId}) async {
    await _remoteDataSource.removeHome(homeId: homeId);
  }

  @override
  Future<void> updateHome({required HomeEntity homeEntity}) {
    // TODO: implement updateHome
    throw UnimplementedError();
  }
}
