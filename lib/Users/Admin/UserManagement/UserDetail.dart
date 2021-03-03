import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/User/Bloc/User_event.dart';
import 'package:flutter_group_project/Features/User/Bloc/bloc.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Users/Admin/UserManagement/AddUpdateAdmin.dart';
import 'package:flutter_group_project/Users/Admin/admin.dart';

import 'package:flutter_group_project/Users/Common/ScreenRoute.dart';

import '../../../ScreenRoute.dart';


class UserDetail extends StatelessWidget {//To show detail of User
  static const routeName = 'userDetail';
  final User user;

  UserDetail({@required this.user});

  @override
  Widget build(BuildContext context) {

    print("User Detail Page");

    return Scaffold(
      appBar: AppBar(
        title: Text('${(this.user.FullName)}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateAdmin.routeName,
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
                    AdminMainPage.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('User Email: ${this.user.Email}'),
              subtitle: Text('Full Name: ${this.user.FullName}'),
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
            Text('Phone: ${this.user.Phone}',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 10,
            ),
            Text('Role: ${this.user.Role.roleName}',style: TextStyle(
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
