import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Authentication/authntication.dart';
import 'package:flutter_group_project/Features/Authentication/bloc/auth_blocs.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:flutter_group_project/Users/Admin/JobDisplayScreen/adminJobMainPage.dart';
import 'package:flutter_group_project/Users/Admin/RoleDisplayScreen/adminRoleMainPage.dart';
import 'package:flutter_group_project/Users/Admin/UserManagement/UserDetail.dart';
import 'package:flutter_group_project/Users/Common/ScreenRoute.dart';
import 'package:flutter_group_project/Users/Common/drawer.dart';
import 'package:flutter_group_project/Users/Common/login_page.dart';
import '../../ScreenRoute.dart';
import 'ServiceDisplayScreen/adminService.dart';
import 'UserManagement/adminUserMainPage.dart';


class AdminMainPage extends StatefulWidget {
//  final int index;
  final User args;
  AdminMainPage({@required this.args});
  static const routeName='/admin';
  @override
  _AdminMainPageState createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  List<Widget> homeWidgets = [
    AdminJobMainPage(),
    AdminRoleMainPage(),
    AdminServiceMainPage(),
    // Center(child: Text("No users yet!"),)
    AdminUserMainPage()
  ];

  int _navIndex = 0;

  String get title{
    if (_navIndex == 0){
      return 'Jobs';
    }else if(_navIndex ==1){
      return 'Roles';
    }
    else if(_navIndex ==2){
      return 'services';
    }else{
      return 'users';
    }
  }

  @override
  Widget build(BuildContext context) {
    print('the index is ${_navIndex}');
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigator.of(context).pushNamed(
              //   AddUpdateUser.routeName,
              //   arguments: UserArgument(user: this.technician, edit: true),
              // )


                Navigator.of(context)
                    .pushNamed(
                    UserDetail.routeName, arguments: widget.args);
              },


          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // BlocProvider.of<UserBloc>(context).add(UserDelete(this.technician));
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //     SignIn.routeName, (route) => false);
              }),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // isAuthenticated=false;
                // isTechnician=false;
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //     SignIn.routeName, (route) => false);
              }),
        ],
      ),
      drawer:CommonDrawerClass(),
      body: homeWidgets[_navIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Theme.of(context).primaryColor,
        items: [
          Icon(Icons.cleaning_services_rounded,color: Colors.white,size: 25.0,),
          Icon(Icons.supervised_user_circle,color: Colors.white,size: 25.0),
          Icon(Icons.history,color: Colors.white,size: 25.0),
          Icon(Icons.history,color: Colors.white,size: 25.0),
        ],

        height: 50,
        animationDuration: Duration(
            microseconds: 500
        ),
        animationCurve: Curves.bounceOut,
        onTap: (index){
            setState(() {
              _navIndex = index;
            });
        },
      ),
    );
  }

}
