part of 'auth_repository.dart';

class _AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final UserProfileRemoteDataSource _userProfileRemoteDataSource;

  _AuthRepositoryImpl(
      {required AuthRemoteDataSource authRemoteDataSource,
      required UserProfileRemoteDataSource userProfileRemoteDataSource})
      : _authRemoteDataSource = authRemoteDataSource,
        _userProfileRemoteDataSource = userProfileRemoteDataSource;


 
  @override
  Future<UserEntity?> login() async {
    try {
      final User? userAuth = await _authRemoteDataSource.login();

      if (userAuth != null) {
        final UserModel? userModel =
            await _userProfileRemoteDataSource.getUserInfoFromId(id: userAuth.uid);

        if (userModel != null) {
          return UserEntity.fromModel(userModel);
        } else {
          final UserModel userModelCreated = await _userProfileRemoteDataSource
              .createUserFromUserModel(userModel: UserModel.fromUserAuth(userAuth));
          return UserEntity.fromModel(userModelCreated);
        }
      }

      return null;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<void> logout() async {
    await _authRemoteDataSource.logout();
  }

  
  @override
  Future<UserEntity?> getUserEntity() async {
    try {
      final User? userAuth = _authRemoteDataSource.getCurrentUser();
      if (userAuth == null) {
        return null;
      } else {
        final UserModel? userModel =
            await _userProfileRemoteDataSource.getUserInfoFromId(id: userAuth.uid);

        return (userModel != null) ? UserEntity.fromModel(userModel) : null;
      }
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
