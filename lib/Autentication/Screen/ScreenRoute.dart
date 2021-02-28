import 'package:flutter/material.dart';
import 'package:flutter_group_project/Autentication/Model/User.dart';
import 'package:flutter_group_project/Autentication/Screen/UserDetail.dart';
import 'package:flutter_group_project/Autentication/Screen/User_main_screen.dart';
import 'package:flutter_group_project/Autentication/Screen/login_page.dart';
import 'package:flutter_group_project/Autentication/Screen/signup_page.dart';

import 'AddUpdateUser.dart';


class UserAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => CategoryMainScreen());
    }
    if (settings.name == SignIn.routeName) {
      return MaterialPageRoute(builder: (context) => SignIn());
    }

    if (settings.name == Register.routeName) {
      return MaterialPageRoute(builder: (context) => Register());
    }


    if (settings.name == AddUpdateUser.routeName) {
      UserArgument args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AddUpdateUser(
            args: args,
          ));
    }


    if (settings.name == UserDetail.routeName) {
      User user = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => UserDetail(
            user: user,
          ));
    }

    return MaterialPageRoute(builder: (context) => CategoryMainScreen());
  }
}

class UserArgument {
  final User user;
  final bool edit;
  UserArgument({this.user, this.edit});
}
