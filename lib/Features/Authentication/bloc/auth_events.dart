import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../authntication.dart';


abstract class AuthEvents extends Equatable {}

class AutoLoginEvent extends AuthEvents {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvents {
  final Authentication auth;
  LoginEvent({@required this.auth});
  @override
  List<Object> get props => [];
}

class LogOutEvent extends AuthEvents {
  @override
  List<Object> get props => [];
}
