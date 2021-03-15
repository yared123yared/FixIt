import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_group_project/Features/Role/models/role.dart';
import 'package:flutter_group_project/Features/Role/models/role.dart';




@immutable
class User extends Equatable{

  final int UserId;
  final String Email;
  final String FullName;
  final String Phone;
  final String Password;
  final int RoleId;
  final Rolee Role;
  final String Picture;








  const User({this.UserId,
    @required this.Email,
    @required this.FullName,
    @required this.Phone,
    @required this.Password ,
     this.RoleId ,
     this.Role,
    @required this.Picture ,


  });

  @override
  List<Object> get props => [Email, FullName, Phone, Password, Role, Picture];

  factory User.fromJson(Map<String, dynamic> json) {
    print("user from json is $json");
     User user = User(
      UserId: json["userId"],
      Email: json['email'],
      FullName: json['fullName'],
      Phone: json['phone'],
      Password: json['password'],
      RoleId: json['roleId'],
      Role:json['role'] != null? Rolee.fromJson(json['role']) :null,
      Picture: json['picture']
    );
     print("user form json2 is ${user.RoleId}");
     return user;
  }

  @override
  String toString() => 'User { Email: $Email, Fname: $FullName, Role: $Role ,roleid : $RoleId }';
}


