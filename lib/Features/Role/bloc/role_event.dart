import 'package:flutter_group_project/Features/Role/models/role.dart';


class RoleCreate extends RoleEvent {
  final Rolee role;

  RoleCreate(this.role);

  @override
  List<Object> get props => [role];

  @override
  String toString() => 'role Created {role: $role}';
}
class RoleLoad extends RoleEvent{
  RoleLoad();

  @override
  List<Object> get props => [];

}
class RoleUpdate extends RoleEvent {
  final Rolee role;

  RoleUpdate(this.role);

  @override
  List<Object> get props => [role];

  @override
  String toString() => 'role Updated {role: $role}';
}

class RoleDelete extends RoleEvent {
  final Rolee role;

  RoleDelete(this.role);

  @override
  List<Object> get props => [role];

  @override
  String toString() => 'role Deleted {role: $role}';
}

class RoleEvent {}
