import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_group_project/Features/Role/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Role/models/role.dart';
import 'package:flutter_group_project/Features/Role/repository/role_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRoleRepository extends Mock implements RoleRepository {}

void main() {
  test('throws AssertionError if ServiceRepository is null', () {
    expect(
      () => RoleBloc(roleRepository: null),
      throwsA(isAssertionError),
    );
  });

  RoleRepository roleRepository = MockRoleRepository();
  final role1 = Role(
    roleName: "Mock role",
  );
  final role2 = Role(
    roleName: "Mock role2",
  );
  final roles = [role1, role2];

  blocTest(
    'getRoles [RoleLoading, RoleLodingSuccess] when successful',
    build: () {
      when(roleRepository.getRoles()).thenAnswer((_) async => roles);
      return RoleBloc(roleRepository: roleRepository);
    },
    act: (bloc) => bloc.add(RoleLoad()),
    expect: [RoleLoading(), RoleLoadingSuccess(roles)],
  );
  blocTest(
    'createRole [RoleLoading, RoleLodingSuccess] when successful',
    build: () {
      when(roleRepository.createRole(role1)).thenAnswer((_) async => role1);
      return RoleBloc(roleRepository: roleRepository);
    },
    act: (bloc) => bloc.add(RoleLoad()),
    expect: [RoleLoading(), RoleLoadingSuccess(roles)],
  );
  blocTest(
    'deleteRole [RoleLoading, RoleLodingSuccess] when successful',
    build: () {
      when(roleRepository.deleteRole(role1.roleId)).thenAnswer((_) async => {});
      return RoleBloc(roleRepository: roleRepository);
    },
    act: (bloc) => bloc.add(RoleLoad()),
    expect: [RoleLoading(), RoleLoadingSuccess(roles)],
  );
  
  blocTest(
    'upateRole [RoleLoading, RoleLodingSuccess] when successful',
    build: () {
      when(roleRepository.updateRole(role1)).thenAnswer((_) async => roles);
      return RoleBloc(roleRepository: roleRepository);
    },
    act: (bloc) => bloc.add(RoleLoad()),
    expect: [RoleLoading(), RoleLoadingSuccess(roles)],
  );
}
