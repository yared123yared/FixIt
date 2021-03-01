
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Authentication/bloc/auth.dart';

import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Users/Admin/UserManagement/UserDetail.dart';
import 'package:flutter_group_project/Users/Admin/UserManagement/User_main_screen.dart';
import 'package:flutter_group_project/Users/Common/signup_page.dart';
import 'package:flutter_group_project/Users/NormalUser/UserUpdate/AddUpdateUser.dart';
import 'package:flutter_group_project/Users/NormalUser/UserUpdate/Users_main.dart';
import 'package:flutter_group_project/Users/Technicians/TechnicianUpdate/Technician_main.dart';
import 'package:flutter_group_project/Users/Common/loading_screen.dart';
import 'package:flutter_group_project/Users/Common/login_page.dart';

bool isAuthenticated = false;
bool isAdmin = false;
bool isTechnician = false;
User user;
class UserAppRoute {//All the routing info
  static Route generateRoute(RouteSettings settings,) {
    if (settings.name == '/') {
      return MaterialPageRoute(
          builder: (context) =>
              BlocBuilder<AuthBloc, AuthStates>(builder: (context, state) {
                if (state is AutoLoginState) {
                  return loading_screen(title: 'Authenticating');
                } else if (state is AutoLoginSuccessState) {//If the User has already signed in switch by the role
                  isAdmin = state.user.Role == 'ADMIN';
                  isTechnician = state.user.Role == 'TECHNICIAN';
                  isAuthenticated = true;
                  user=state.user;
                } else if (state is AutoLoginFailedState) {
                  isAuthenticated = false;
                } else if (state is LoggingOutState) {
                  return loading_screen(title: 'Logging out');
                } else if (state is LoggingOutSuccessState) {
                  isAuthenticated = false;
                } else if (state is LoggingOutErrorState) {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('An Error Occurred!'),
                      content: Text('Failed to log out'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Okay'),
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                        )
                      ],
                    ),
                  );
                }
                return isAuthenticated
                    ? (isAdmin ? CategoryMainScreen( admin: user) : (isTechnician? Technician_main(technician: user) : Users_main(user: user)))
                    : SignIn();
              }));
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

    return MaterialPageRoute(builder: (context) => CategoryMainScreen(admin: user));
  }
}

class UserArgument {
  final User user;
  final bool edit;
  UserArgument({this.user, this.edit});
}
