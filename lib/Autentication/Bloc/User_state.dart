import 'package:equatable/equatable.dart';
import 'package:flutter_group_project/Autentication/Model/User.dart';


class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}
class UserLoading extends UserState {}

class UsersLoadSuccess extends UserState{
  final List<User> user;

  UsersLoadSuccess([this.user = const []]);

  @override
  List<Object> get props => [user];
}
class UserLoadSuccess extends UserState{
  final User user;

  UserLoadSuccess([this.user]);

  @override
  List<Object> get props => [user];
}

class UserOperationFailure extends UserState {}
