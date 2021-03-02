//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_group_project/Features/Authentication/bloc/auth.dart';
//
// // import 'package:flutter_group_project/Features/User/Model/User.dart';
// import 'package:flutter_group_project/Users/Admin/UserManagement/AddUpdateAdmin.dart';
// import 'package:flutter_group_project/Users/Admin/UserManagement/UserDetail.dart';
// import 'package:flutter_group_project/Users/Admin/UserManagement/User_main_screen.dart';
// import 'package:flutter_group_project/Users/Admin/adminMainPage.dart';
// import 'package:flutter_group_project/Users/Common/signup_page.dart';
// import 'package:flutter_group_project/Users/NormalUser/UserUpdate/AddUpdateUser.dart';
// import 'package:flutter_group_project/Users/NormalUser/UserUpdate/Users_main.dart';
// import 'package:flutter_group_project/Users/Technicians/TechnicianUpdate/Technician_main.dart';
// import 'package:flutter_group_project/Users/Common/loading_screen.dart';
// import 'package:flutter_group_project/Users/Common/login_page.dart';
//
// bool isAuthenticated = false;
// bool isAdmin = false;
// bool isTechnician = false;
// User user;
// class UserAppRoute {//All the routing info
//   static Route generateRoute(RouteSettings settings,) {
//
//     if (settings.name == SignIn.routeName) {
//       return MaterialPageRoute(builder: (context) => SignIn());
//     }
//
//     if (settings.name == Register.routeName) {
//       return MaterialPageRoute(builder: (context) => Register());
//     }
//     if (settings.name == AddUpdateAdmin.routeName) {
//       UserArgument args = settings.arguments;
//       return MaterialPageRoute(
//           builder: (context) => AddUpdateAdmin(
//             args: args,
//           ));
//     }
//
//     if (settings.name == AddUpdateUser.routeName) {
//       UserArgument args = settings.arguments;
//       return MaterialPageRoute(
//           builder: (context) => AddUpdateUser(
//             args: args,
//           ));
//     }
//
//
//     if (settings.name == UserDetail.routeName) {
//       User user = settings.arguments;
//       return MaterialPageRoute(
//           builder: (context) => UserDetail(
//             user: user,
//           ));
//     }
//
//     return MaterialPageRoute(builder: (context) => AdminMainPage());
//   }
// }
//
// class UserArgument {
//   final User user;
//   final bool edit;
//   UserArgument({this.user, this.edit});
// }
