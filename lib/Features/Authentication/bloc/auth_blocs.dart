import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_group_project/Features/Authentication/repository/AuthenticationRepository.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';

import '../authntication.dart';


class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final AuthenticationRepository authRepository;
  final Util util;
  AuthBloc({@required this.authRepository, @required this.util})
      : assert(authRepository != null),
        super(AuthUninitializedState());
  @override
  Stream<AuthStates> mapEventToState(AuthEvents event) async* {
    if (event is AutoLoginEvent) {
      yield* _mapAutoLoginEventToState();
    } else if (event is LoginEvent) {
      yield* _mapLoginEventToState(event.auth);
    }else if(event is LogOutEvent){
      await util.removeToken();
      await util.removeUser();
      yield LoggingOutSuccessState();
    }
  }

  Stream<AuthStates> _mapLoginEventToState(Authentication user) async* {
    print("+++++++++++LoginEvent+++++");
    yield LoggingState();
    User u;
    try {
      u = await authRepository.login(user);
      await util.storeUserInformation(u);
      yield LoginSuccessState(user: u);
    } on HttpException catch (e) {
      if (e.message == 'Incorrect username or password') {
        yield IncorrectUsernameOrPasswordState();
      } else if (e.message == 'Invalid Input') {
        yield InvalidInputState();
      } else {
        yield LoginFailedState();
      }
    } catch (e) {
      yield LoginFailedState();
    }
  }

  // Stream<AuthStates> _mapSignUpEventToState(User user) async* {
  //   yield SigningUpState();
  //   User u;
  //   try {
  //     u = await userRepository.signUp(user);
  //     yield SignUpSuccessState(user: u);
  //   } on HttpException catch (e) {
  //     if (e.message == 'Email already exists!') {
  //       yield EmailAlreadyExistState();
  //     } else if (e.message == 'Phone No already exists!') {
  //       yield PhoneAlreadyExistState();
  //     } else {
  //       yield SignUpFailedState();
  //     }
  //   } catch (e) {
  //     yield SignUpFailedState();
  //   }
  // }

  Stream<AuthStates> _mapAutoLoginEventToState() async* {
    yield AutoLoginState();
    try {
      String token = await util.getUserToken();
      print("TOKEN+++++ $token");
      if (token == null) {
        yield AutoLoginFailedState();
        return;
      }
      // String expiry = await util.getUserToken();
      // if (expiry == null) {
      //   yield AutoLoginFailedState();
      //   return;
      // }
      // bool isExpired = util.isExpired(expiry);
      // if (isExpired) {
      //   yield AutoLoginFailedState();
      //   return;
      // } else {
    else{
        User user = await util.getUserInformation();
        print("SUCESSSS STATE $user");
        yield AutoLoginSuccessState(user: user);
      }
    } catch (e) {
      yield AutoLoginFailedState();
    }
  }
}


