import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  final int createdAt;
  final String email;
  final String id;
  String? image;
  final String name;
  final int coin;

  UserModel(
      {required this.createdAt,
      required this.email,
      required this.id,
      required this.image,
      required this.name,
      required this.coin});

  factory UserModel.fromUserAuth(User user) => UserModel(
      createdAt: DateTime.now().millisecondsSinceEpoch,
      email: user.email ?? '',
      id: user.uid,
      coin: 1000000,
      image: user.photoURL,
      name: user.displayName ?? "An danh");

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
