import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Autentication/Bloc/User_event.dart';
import 'package:flutter_group_project/Autentication/Bloc/bloc.dart';
import 'package:flutter_group_project/Autentication/Model/User.dart';
import 'package:flutter_group_project/Autentication/Screen/AddUpdateUser.dart';
import 'package:flutter_group_project/Autentication/Screen/ScreenRoute.dart';
import 'package:flutter_group_project/Autentication/Screen/login_page.dart';


class Technician_main extends StatelessWidget {//Main page for the TECHNICIAN
  static const routeName = 'techniciansMain';
  final User technician;

  Technician_main({@required this.technician});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${(this.technician.fName)}'),
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
          "This is Technician ${this.technician.fName}",
        ),
      ),
    );
  }
}
