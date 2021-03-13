import 'package:flutter_group_project/Features/Role/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Role/repository/role_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState>{
  final RoleRepository roleRepository;
  final Util util;

  RoleBloc({@required this.roleRepository,@required this.util})
      : assert(roleRepository != null),
        super(RoleLoading());

  @override
  Stream<RoleState> mapEventToState(RoleEvent event) async* {
    if (event is RoleLoad) {
      yield RoleLoading();
      try {
        final role = await roleRepository.getRoles();
        yield RoleLoadingSuccess(roles: role);
      } catch (err) {
        print('the error is -$err');
        yield RoleOperationFailure();
      }
    }
    if (event is RoleCreate) {
      yield RoleLoading();
      try {
        await roleRepository.createRole(event.role);
        final role = await roleRepository.getRoles();
        yield RoleLoadingSuccess(roles: role);
      } catch (e) {
        print("Error: $e");
        yield RoleOperationFailure();
      }
    }

    if (event is RoleUpdate) {
      yield RoleLoading();
      try {
        await roleRepository.updateRole(event.role);
        final role = await roleRepository.getRoles();
        yield RoleLoadingSuccess(roles: role);
      } catch (_) {
        yield RoleOperationFailure();
      }
    }
    if (event is RoleDelete) {
      yield RoleLoading();
      try {
        await roleRepository.deleteRole(event.role.roleId);
        final role = await roleRepository.getRoles();
        yield RoleLoadingSuccess(roles: role);
      } catch (e) {
        print("Delete Error: $e");
        yield RoleOperationFailure();
      }
    }


  }

  
}