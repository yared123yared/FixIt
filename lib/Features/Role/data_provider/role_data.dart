import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_group_project/Features/Role/models/models.dart';
import 'package:http/http.dart' as http;

class RoleDataProvider {
  final _baseUrl = "http://192.168.137.1:3000/api/roles";
  final http.Client httpClient;

  RoleDataProvider({@required this.httpClient}) : assert(httpClient != null);
  Future<Role> createRole(Role role) async {
    print("creating role");
    print('role: $role');
    final response = await httpClient.post(
      Uri.http('192.168.137.1:3000', '/api/roles'),
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
      return Role.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create role.');
    }
  }

  Future<List<Role>> getRoles() async {
    print("Getint all the roles");
    final response = await httpClient.get('$_baseUrl');

    if (response.statusCode == 200) {
      final roles = jsonDecode(response.body) as List;
      print(roles);
      List<Role> lists = roles.map((role) => Role.fromJson(role)).toList();
      print(lists);

      return roles.map((course) => Role.fromJson(course)).toList();
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

  Future<void> updateRole(Role role) async {
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
