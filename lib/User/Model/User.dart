import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';




@immutable
class User extends Equatable{
  final String email;
  final String fName;
  final String lName;
  final String password;
  final String role;
  final String imageUrl;


  const User({
    @required this.email,
    @required this.fName,
    @required this.lName,
    @required this.password ,
    @required this.role,
    @required this.imageUrl ,



  });

  @override
  List<Object> get props => [email, fName, lName, password, role, imageUrl];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      fName: json['fName'],
      lName: json['lName'],
      password: json['password'],
      role: json['role'],
      imageUrl: json['imageUrl']
    );
  }

  @override
  String toString() => 'User { Email: $email, Fname: $fName, Role: $role }';
}


