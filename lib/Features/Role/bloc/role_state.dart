
import 'package:flutter_group_project/Features/Role/models/models.dart';

class RoleState extends Equatable{
   RoleState();
  @override
  List<Object> get props => [];
}

class Equatable {
}

class RoleLoading extends RoleState{}

class RoleLoadingSuccess extends RoleState{
  final List<Role> roles;

  RoleLoadingSuccess([this.roles = const []]);

  @override
  List<Object> get props => [roles];
}
class RoleOperationFailure extends RoleState{
  
}