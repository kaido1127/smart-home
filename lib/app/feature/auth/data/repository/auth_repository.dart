import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/user_entity.dart';
import '../data_source/auth_remote_data_source.dart';
import '../data_source/user_profile_remote_data_source.dart';
import '../model/user_model.dart';

part 'auth_repository_impl.dart';

abstract interface class AuthRepository {
  Future<UserEntity?> login();

  Future<void> logout();

  Future<UserEntity?> getUserEntity();

  factory AuthRepository.create(
          {required AuthRemoteDataSource authRemoteDataSource,
          required UserProfileRemoteDataSource userProfileRemoteDataSource}) =>
      _AuthRepositoryImpl(
          authRemoteDataSource: authRemoteDataSource,
          userProfileRemoteDataSource: userProfileRemoteDataSource);
}
