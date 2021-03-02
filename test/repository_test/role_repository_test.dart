import 'package:flutter_group_project/Features/Role/data_provider/data__provider.dart';
import 'package:flutter_group_project/Features/Role/models/role.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

class MocRoleDataProvider extends Mock implements RoleDataProvider {}

main() {
  group('role repository test', () {
    final role1 = Role(
      roleName: "Mock role 2",);
  final role2 = Role(
      roleName: "Mock role 2",);
// final roles = [role1, role2];
  RoleDataProvider roleDataProvider = MocRoleDataProvider();
  List<Role> roles = [];
  test('Get all roles', () async {
    when(roleDataProvider.getRoles()).thenAnswer((_) async {
      return roles;
    });
    expect(roles.length, 0);
  });

  test('create role', () async {
    when(roleDataProvider.createRole(role1)).thenAnswer((_) async {
      roles.add(role1);
      return Future.value(role1);
    });
    expect(roles.length, 0);
  });

  test('delete role', () async {
    when(roleDataProvider.deleteRole(role1.roleId)).thenAnswer((_) async {
      roles.remove(role1);
      return Future.value(role1);
    });

    expect(roles.length, 0);
  });
  test('update role', () async {
    when(roleDataProvider.deleteRole(role1.roleId)).thenAnswer((_) async {
      roles.add(role2);
          });
    expect(roles.length, 0);
  });
  });
}
