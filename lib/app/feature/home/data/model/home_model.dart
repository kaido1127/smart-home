import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class HomeModel {
  final String hostId;
  final String homeName;
  final int roomCount;
  final int runningDeviceCount;
  final int createAt;

  HomeModel(
      {required this.hostId,
      required this.homeName,
      required this.roomCount,
      required this.runningDeviceCount,
      required this.createAt});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
