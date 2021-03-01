import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';



@immutable
class Role extends Equatable{

  final int roleId;
  final String roleName;









  const Role({
    @required this.roleId,
    @required this.roleName,

  });

  @override
  List<Object> get props => [roleId, roleName];

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
        roleName: json['roleId'],
        roleId: json['roleName'],
    );
  }

  @override
  String toString() => 'Role { RoleName: $roleName, RoleId: $roleId}';
}


