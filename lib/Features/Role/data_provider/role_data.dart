import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_group_project/Features/Role/models/models.dart';
import 'package:flutter_group_project/ip_address.dart';
import 'package:http/http.dart' as http;

import '../../../ip_address.dart';

class RoleDataProvider {
  final _baseUrl = "${IpAdress.ipAddress}/api/roles";
  final http.Client httpClient;

  RoleDataProvider({@required this.httpClient}) : assert(httpClient != null);
  Future<Rolee> createRole(Rolee role) async {
    print("creating role");
    print('role: $role');
    final response = await httpClient.post(
      Uri.http('192.168.137.1:5001', '/api/roles'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'RoleName': role.roleName,
      }),
    );

    print("response: ${response.body}");
    if (response.statusCode == 200) {
      print('Creating the roles');
      return Rolee.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create role.');
    }
  }

  Future<List<Rolee>> getRoles() async {
    print("Getint all the roles");
    final response = await httpClient.get('$_baseUrl');

    if (response.statusCode == 200) {
      final roles = jsonDecode(response.body) as List;
      print(roles);
      List<Rolee> lists = roles.map((role) => Rolee.fromJson(role)).toList();
      print(lists);

      return roles.map((course) => Rolee.fromJson(course)).toList();
    } else {
      throw Exception('Failed to load role');
    }
  }

  Future<void> deleteRole(int id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete role.');
    }
  }

  Future<void> updateRole(Rolee role) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/${role.roleId}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'RoleId': role.roleId,
        'RoleName': role.roleName,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update role.');
    }
  }
}
