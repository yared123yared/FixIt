import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Rolee extends Equatable {
  int roleId;
  final String roleName;

  Rolee({@required this.roleName, this.roleId});
  factory Rolee.fromJson(Map<String, dynamic> json) {
    return Rolee(
      roleId: json['roleId'],
      roleName: json['roleName']
    );
  }

  @override
  List<Object> get props => [];
}
