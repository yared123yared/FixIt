import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_group_project/Features/Role/models/models.dart';





@immutable
class User extends Equatable{

  final int UserId;
  final String Email;
  final String FullName;
  final String Phone;
  final String Password;
  final int RoleId;
  final String Picture;
  final Rolee Role;








  const User({this.UserId,
    @required this.Email,
    @required this.FullName,
    @required this.Phone,
    @required this.Password ,
     this.Role,
    @required this.Picture,
     this.RoleId,



  });

  @override
  List<Object> get props => [Email, FullName, Phone, Password, Role, Picture];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      UserId: json["userId"],
      Email: json['email'],
      FullName: json['fullName'],
      Phone: json['phone'],
      Password: json['password'],
      Role: Rolee.fromJson(json['role']),
      Picture: json['picture']
    );
  }

  @override
  String toString() => 'User { Email: $Email, Fname: $FullName, Role: $Role }';
}


