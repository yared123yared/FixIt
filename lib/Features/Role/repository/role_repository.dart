
import 'package:flutter_group_project/Features/Role/data_provider/role_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/Role/models/models.dart';

class RoleRepository{
  final RoleDataProvider dataProvider;

  RoleRepository({@required this.dataProvider})
      : assert(dataProvider != null);
  Future<Role> createRole(Role role) async {
    return await dataProvider.createRole(role);
  }
  Future<List<Role>> getRoles() async {
    return await dataProvider.getRoles();
  }
  Future<void> updateRole(Role role) async {
    await dataProvider.updateRole(role);
  }
  Future<void> deleteRole(int id) async {
    await dataProvider.deleteRole(id);
  }

}