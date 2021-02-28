import 'package:equatable/equatable.dart';
import 'package:flutter_group_project/Autentication/Model/User.dart';
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
class AutoLoginState extends UserState {}

class AutoLoginSuccessState extends UserState {//TO check if the user has already logged in on starting the app
  final User user;
  AutoLoginSuccessState({@required this.user});

  @override
  List<Object> get props => [user];
}

class AutoLoginFailedState extends UserState {
  final String message;
  AutoLoginFailedState({this.message});
}
class LoggingOutState extends UserState {}

class LoggingOutSuccessState extends UserState {}

class LoggingOutErrorState extends UserState {}
