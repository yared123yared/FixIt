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
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              print("Before navigations user id is ${this.user.UserId}");
              Navigator.of(context).pushNamed(
                AddUpdateAdmin.routeName,
                arguments: UserArgument(user: this.user, edit: true),

              );

            }

          ),
          SizedBox(
            width: 32,
          ),
          
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
              child: Container(
            color: Theme.of(context).primaryColor,
                child: Container(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('Assets/Images/me.jpg'),

                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Center(
                        child: Text("${this.user.FullName}", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      )
                    ],
                  ),
                ),
          )),
          Expanded(
            flex: 6,
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:30.0,top: 10.0,bottom: 10.0),
                      child: Row(
                        children: [
                          Icon(Icons.email,color: Colors.grey,),
                          SizedBox(width: 30.0,),
                          Text('${this.user.Email}',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18.0),)
                        ],
                      ),
                    ),
                    Divider(thickness: 1.5,),
                    Padding(
                      padding: const EdgeInsets.only(left:30.0,top: 10.0,bottom: 10.0),
                      child: Row(
                        children: [
                          Icon(Icons.phone,color: Colors.grey,),
                          SizedBox(width: 30.0,),
                          Text('${this.user.Phone}',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18.0),)
                        ],
                      ),
                    ),
                    Divider(thickness: 1.5,),
                    Padding(
                      padding: const EdgeInsets.only(left:30.0,top: 10.0,bottom: 10.0),
                      child: Row(
                        children: [
                          Icon(Icons.category,color: Colors.grey,),
                          SizedBox(width: 30.0,),
                          Text('${this.user.Role.roleName}',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 18.0),)
                        ],
                      ),
                    ),
                    Divider(thickness: 1.5,),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
