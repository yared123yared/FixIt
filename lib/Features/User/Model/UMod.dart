import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';




@immutable
class UMod extends Equatable{
  final int userId;
  final String email;
  final String fullName;
  final String phone;
  final String password;
  final String role;
  final String picture;
  final String sex;
  final int roleId;
  final String address;
  final String token;

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








  const UMod({
    @required this.email,
    @required this.role,
    @required this.fullName,
    @required this.picture ,
    @required this.phone,
    @required this.userId ,
    @required this.sex,
    @required this.address,
    @required this.password,
    @required this.roleId,
    @required this.token

  });

  @override
  List<Object> get props => [email, role, fullName, picture, phone, userId, sex, address, password, roleId];

  factory UMod.fromJson(Map<String, dynamic> json) {
    return UMod(
        email: json['email'],
        role: json['role'],
        fullName: json['fullName'],
        password: json['password'],
        phone: json['phone'],
        picture: json['picture'],
      sex : json['sex'],
      address : json['address'],
      userId : json['userId'],
      roleId: json["roleId"],
      token: json["token"]

    );
  }

  @override
  String toString() => 'User { Email: $email, Fname: $fullName, Role: $role }';
}


