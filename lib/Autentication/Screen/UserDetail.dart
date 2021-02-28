import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Autentication/Bloc/User_event.dart';
import 'package:flutter_group_project/Autentication/Bloc/bloc.dart';
import 'package:flutter_group_project/Autentication/Model/User.dart';
import 'package:flutter_group_project/Autentication/Screen/AddUpdateUser.dart';
import 'package:flutter_group_project/Autentication/Screen/ScreenRoute.dart';
import 'package:flutter_group_project/Autentication/Screen/User_main_screen.dart';


class UserDetail extends StatelessWidget {//To show detail of User
  static const routeName = 'userDetail';
  final User user;

  UserDetail({@required this.user});

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
                    CategoryMainScreen.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('User Email: ${this.user.email}'),
              subtitle: Text('Full Name: ${this.user.fName}'),
            ),
            Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Phone: ${this.user.phone}',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 10,
            ),
            Text('Role: ${this.user.role}',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
    );
  }
}
