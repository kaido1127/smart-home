import 'package:smart_home/app/feature/home/data/model/home_model.dart';

class HomeEntity {
  final String hostId;
  final String homeName;
  final int roomCount;
  final int runningDeviceCount;
  final int createAt;

  HomeEntity(
      {required this.hostId,
      required this.homeName,
      required this.roomCount,
      required this.runningDeviceCount,
      required this.createAt});

  factory HomeEntity.fromModel(HomeModel homeModel) => HomeEntity(
      hostId: homeModel.hostId,
      homeName: homeModel.homeName,
      roomCount: homeModel.roomCount,
      runningDeviceCount: homeModel.runningDeviceCount,
      createAt: homeModel.createAt);

  HomeModel toModel() => HomeModel(
      hostId: hostId,
      homeName: homeName,
      roomCount: roomCount,
      runningDeviceCount: runningDeviceCount,
      createAt: createAt);
}
