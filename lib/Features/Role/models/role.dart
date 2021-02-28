import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Role extends Equatable {
  int roleId;
  final String roleName;

  Role({@required this.roleName, this.roleId});
  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      roleId: json['RoleId'],
      roleName: json['RoleName']
    );
  }

  @override
  List<Object> get props => [];
}
