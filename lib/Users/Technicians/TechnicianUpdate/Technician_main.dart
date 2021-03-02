import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/User/Bloc/User_event.dart';
import 'package:flutter_group_project/Features/User/Bloc/bloc.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Users/Common/ScreenRoute.dart';
import 'package:flutter_group_project/Users/Common/login_page.dart';
import 'package:flutter_group_project/Users/NormalUser/UserUpdate/AddUpdateUser.dart';

import '../../../ScreenRoute.dart';


class Technician_main extends StatelessWidget {//Main page for the TECHNICIAN
  static const routeName = 'techniciansMain';
  final User technician;

  Technician_main({@required this.technician});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${(this.technician.FullName)}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateUser.routeName,
              arguments: UserArgument(user: this.technician, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                BlocProvider.of<UserBloc>(context).add(UserDelete(this.technician));
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
                isTechnician=false;
                Navigator.of(context).pushNamedAndRemoveUntil(
                    SignIn.routeName, (route) => false);
              }),
        ],
      ),
      body: Center(
        child: Text(
          "This is Technician ${this.technician.FullName}",
        ),
      ),
    );
  }
}
