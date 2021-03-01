import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/User/Bloc/User_event.dart';
import 'package:flutter_group_project/Features/User/Bloc/bloc.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Users/Common/ScreenRoute.dart';
import 'package:flutter_group_project/Users/Common/login_page.dart';
import 'package:flutter_group_project/Users/NormalUser/UserUpdate/AddUpdateUser.dart';


class Users_main extends StatelessWidget {//Main page of the User
  static const routeName = 'usersMain';
  final User user;

  Users_main({@required this.user});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('${(this.user.fName)}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateUser.routeName,
              arguments: UserArgument(user: this.user, edit: true),
          ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                BlocProvider.of<UserBloc>(context).add(UserDelete(this.user));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    SignIn.routeName, (route) => false);
              }),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                isAuthenticated=false;
                Navigator.of(context).pushNamedAndRemoveUntil(
                    SignIn.routeName, (route) => false);
              }),
        ],
        ),

      body: Center(
        child: Text(
          "This is User ${this.user.fName}",
        ),
      ),
    );
  }
}
