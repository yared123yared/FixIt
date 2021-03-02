import 'package:flutter_group_project/Features/Role/data_provider/data__provider.dart';
import 'package:flutter_group_project/Features/Role/models/role.dart';
import 'package:flutter_group_project/Features/Role/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MocRoleDataProvider extends Mock implements RoleDataProvider {}

main() {
  group('role repository test', () {
    final role1 = Role(
      roleName: "Mock role 2",
    );
    RoleDataProvider roleDataProvider = MocRoleDataProvider();
    RoleRepository roleRepository =
        RoleRepository(dataProvider: roleDataProvider);
//     List<Role> Roles = [];
    test('get all Roles', () async {
      when(roleRepository.getRoles()).thenAnswer((_) async {
        return Future.value();
      });

      roleRepository.getRoles();

      verify(roleRepository.getRoles()).called(1);
    });

    test('create Role', () async {
      when(roleRepository.createRole(role1)).thenAnswer((_) async {
        return Future.value();
      });

      roleRepository.createRole(role1);

      verify(roleRepository.createRole(role1)).called(1);
    });

    test('delete Role', () async {
      when(roleRepository.deleteRole(role1.roleId)).thenAnswer((_) async {
        return Future.value();
      });

      roleRepository.deleteRole(role1.roleId);

      verify(roleRepository.deleteRole(role1.roleId)).called(1);
    });

    test('update Role', () async {
      when(roleRepository.updateRole(role1)).thenAnswer((_) async {
        return Future.value();
      });

      roleRepository.updateRole(role1);

      verify(roleRepository.updateRole(role1)).called(1);
    });
  });
}
