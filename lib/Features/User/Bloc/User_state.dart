import 'package:equatable/equatable.dart';
import 'package:flutter_group_project/Features/User/Model/models.dart';
import 'package:flutter/material.dart';



class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}
class UserLoading extends UserState {}//While loading

class UsersLoadSuccess extends UserState{//On success getting List of Users
  final List<User> user;

  UsersLoadSuccess([this.user = const []]);

  @override
  List<Object> get props => [user];
}
class UserLoadSuccess extends UserState{//On getting one specific User
  final User user;

  UserLoadSuccess([this.user]);

  @override
  List<Object> get props => [user];
}

class UserOperationFailure extends UserState {}
class SignUpSuccessState extends UserState {
  final User user;
  SignUpSuccessState({@required this.user});
}

class EmailAlreadyExistState extends UserState {}

class PhoneAlreadyExistState extends UserState {}

class IncorrectUsernameOrPasswordState extends UserState {}

class InvalidInputState extends UserState {}

class SignUpFailedState extends UserState {
  final String message;
  SignUpFailedState({this.message});
}
