import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_home/app/feature/home/data/repository/home_repository_provider.dart';
import 'package:smart_home/app/feature/home/domain/home_entity.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  Stream<List<HomeEntity>> build(String userID) {
    return ref.watch(homeRepositoryProvider).getAllHome(userID: userID);
  }

  Future<void> createHome({required String homeName}) async {
    try {
      ref.read(homeRepositoryProvider).createHome(
          homeEntity: HomeEntity(
              hostId: userID,
              homeName: homeName,
              roomCount: 0,
              runningDeviceCount: 0,
              createAt: DateTime.now().millisecondsSinceEpoch));
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<void> removeHome({required String homeId}) async {
    ref.read(homeRepositoryProvider).removeHome(homeId: homeId);
  }
}
