import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';



 class AuthStates extends Equatable{
   AuthStates();

  @override
  List<Object> get props => [];
}

class AuthUninitializedState extends AuthStates {}

class AutoLoginState extends AuthStates {}

class AutoLoginSuccessState extends AuthStates {
  // final User user;
  // AutoLoginSuccessState({@required this.user});
  // @override
  // List<Object> get props => [user];

  final User user;

  AutoLoginSuccessState({this.user});

  @override
  List<Object> get props => [user];
}

class AutoLoginFailedState extends AuthStates {
  final String message;
  AutoLoginFailedState({this.message});


}

class LoggingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final User user;
  LoginSuccessState({@required this.user});
  @override
  List<Object> get props => [user];
}

class LoginFailedState extends AuthStates {
  final String message;
  LoginFailedState({this.message});
}

class SigningUpState extends AuthStates {}


class IncorrectUsernameOrPasswordState extends AuthStates {}

class InvalidInputState extends AuthStates {}


class LoggingOutState extends AuthStates {}

class LoggingOutSuccessState extends AuthStates {}

class LoggingOutErrorState extends AuthStates {}
