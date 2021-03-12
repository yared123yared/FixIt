import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Authentication/bloc/auth.dart';
import 'package:flutter_group_project/Features/Authentication/bloc/auth_blocs.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:flutter_group_project/Users/Admin/UserManagement/UserDetail.dart';

import 'login_page.dart';

class CommonDrawerClass extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Util util= new Util();
    User user;
    util.getUserInformation().then((user) {
      user = user;
    });


    return Drawer(
      child:Column(

        children: [
          UserAccountsDrawerHeader(

            accountName: Text(user.FullName),
            accountEmail: Text(user.Email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("Assets/assets/fixit.png"),
            ),
            arrowColor: Colors.purple,
//              decoration: BoxDecoration(
//                gradient: LinearGradient(begin: Alignment.bottomLeft,end: Alignment.topRight,
//                    colors:[Colors.blue,Colors.green]
//                ),
//                // color: Colors.purpleAccent
//              ),

          ),
          ListTile(
            leading: Icon(Icons.contact_page),
            title: Text('account'),
            onTap: () async{
              Navigator.of(context)
                  .pushNamed(
                  UserDetail.routeName,arguments:user);
            },

          ),
          // ListTile(
          //   leading: Icon(Icons.favorite),
          //   title: Text('favorite'),
          // ),
          Divider(height: 20,),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: (){
//                Navigator.of(context).pop();
                BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
                Navigator.of(context).pushReplacementNamed(SignIn.routeName);
              }
          ),
          Divider(height: 20,),
          ListTile(
            trailing: Icon(Icons.close),
            title: Text('Close'),
            onTap: (){
              Navigator.of(context).pop();
            },
          )


        ],
      ),

    );
  }
//
//  Future<User> getUserInfo() async{
//    Util util= new Util();
//    User user  await util.getUserInformation();
//    return user;
//  }
//  Future<User> _getUserInfo() async {
//    User fetchedUser;
//    Util util= new Util();
//    var snapshot = await util.getUserInformation();
//
//    return User(snapshot);
//  }
  }

