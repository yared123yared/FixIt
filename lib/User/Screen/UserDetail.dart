import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/User/Bloc/User_event.dart';
import 'package:flutter_group_project/User/Bloc/bloc.dart';
import 'package:flutter_group_project/User/Model/User.dart';
import 'package:flutter_group_project/User/Screen/AddUpdateUser.dart';
import 'package:flutter_group_project/User/Screen/ScreenRoute.dart';
import 'package:flutter_group_project/User/Screen/User_main_screen.dart';


class UserDetail extends StatelessWidget {
  static const routeName = 'userDetail';
  final User user;

  UserDetail({@required this.user});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('${(this.user.fName+""+this.user.phone)}'),
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
              title: Text('Service Name: ${this.user.email}'),
              subtitle: Text('Category: ${this.user.fName}'),
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
            Text('Description: ${this.user.phone}',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 10,
            ),
            Text('Initial Price: ${this.user.role}',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(
              height: 10,
            ),
            Text('Intermediate Price: ${this.user.password}',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
    );
  }
}
