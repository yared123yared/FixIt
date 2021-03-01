import 'package:flutter_group_project/Features/User/Model/User.dart';

class Authentication{
  final String email;
  final String password;

  Authentication({this.email,this.password});
}
class UserModel{
  final User user;
  final String token;

  UserModel({this.user,this.token});

   factory  UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        user: json['user'] != null ? new User.fromJson(json["user"]): null,
        token: json['token'],

    );
  }
}