
import 'package:flutter_group_project/Features/Role/data_provider/role_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/Role/models/models.dart';

class RoleRepository{
  final RoleDataProvider dataProvider;

  RoleRepository({@required this.dataProvider})
      : assert(dataProvider != null);
  Future<Rolee> createRole(Rolee role) async {
    return await dataProvider.createRole(role);
  }
  Future<List<Rolee>> getRoles() async {
    return await dataProvider.getRoles();
  }
  Future<void> updateRole(Rolee role) async {
    await dataProvider.updateRole(role);
  }
  Future<void> deleteRole(int id) async {
    await dataProvider.deleteRole(id);
  }

}