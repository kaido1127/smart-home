import 'package:json_annotation/json_annotation.dart';

import '../data/model/user_model.dart';

part 'user_entity.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserEntity {
  final String id;
  final String email;
  String? image;
  bool? isOnline;
  int? lastActive;
  final String name;
  final int coin;

  UserEntity(
      {required this.id,
      required this.email,
      required this.image,
      required this.isOnline,
      required this.lastActive,
      required this.name,
      required this.coin});

  factory UserEntity.fromModel(UserModel userModel) {
    int timeNow = DateTime.now().millisecondsSinceEpoch;
    return UserEntity(
        id: userModel.id,
        email: userModel.email,
        image: userModel.image,
        isOnline: false,
        lastActive: timeNow,
        name: userModel.name,
        coin: userModel.coin);
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
