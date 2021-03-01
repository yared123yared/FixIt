import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';




@immutable
class User extends Equatable{

  final String Email;
  final String FullName;
  final String Phone;
  final String Password;
  final String Role;
  final String Picture;








  const User({
    @required this.Email,
    @required this.FullName,
    @required this.Phone,
    @required this.Password ,
    @required this.Role,
    @required this.Picture ,




  });

  @override
  List<Object> get props => [Email, FullName, Phone, Password, Role, Picture];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      Email: json['Email'],
      FullName: json['FullName'],
      Phone: json['Phone'],
      Password: json['Password'],
      Role: json['Role'],
      Picture: json['Picture']
    );
  }

  @override
  String toString() => 'User { Email: $Email, Fname: $FullName, Role: $Role }';
}


