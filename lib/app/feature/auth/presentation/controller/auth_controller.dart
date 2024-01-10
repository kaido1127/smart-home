import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/auth_repository_provider.dart';
import '../../domain/user_entity.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<UserEntity?> build() async {
    return ref.read(authRepositoryProvider).getUserEntity();
  }

  
  Future<void> logout() async {
    state = const AsyncLoading();
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncData(null);
  }

  
  Future<void> login() async {
    state = const AsyncLoading();
    final UserEntity? userEntity = await ref.read(authRepositoryProvider).login();
    state = AsyncData(userEntity);
  }
}
