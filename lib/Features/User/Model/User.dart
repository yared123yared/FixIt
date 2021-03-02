import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_group_project/Features/Role/models/role.dart';
import 'package:flutter_group_project/Features/Role/models/role.dart';




@immutable
class User extends Equatable{

  final String Email;
  final String FullName;
  final String Phone;
  final String Password;
  final int Role;
  final String Picture;

  const User({
    @required this.Email,
    @required this.FullName,
    @required this.Phone,
    @required this.Password ,
    @required this.Role,
    @required this.Picture ,

  //
  // "userId": 1,
  // "fullName": "Fasikaw Kindye",
  // "email": "fasikaw@fixit.com",
  // "password": "fasikaw1234",
  // "phone": "+251212121212",
  // "address": "Sidist-Killo",
  // "picture": "me.jpg",
  // "sex": "Male",
  // "dob": "1999-12-12T00:00:00",
  // "roleId": 2,
  // "role": {
  // "roleId": 2,
  // "roleName": "admins"
  // }

  });

  @override
  List<Object> get props => [Email, FullName, Phone, Password, Role, Picture];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      Email: json['email'],
      FullName: json['fullName'],
      Phone: json['phone'],
      Password: json['password'],
      Role: json['roleId'],
      Picture: json['picture']
    );
  }

  @override
  String toString() => 'User { Email: $Email, Fname: $FullName, Role: $Role }';
}


