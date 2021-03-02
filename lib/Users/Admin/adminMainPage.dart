import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_project/Users/Admin/JobDisplayScreen/adminJobMainPage.dart';
import 'package:flutter_group_project/Users/Admin/RoleDisplayScreen/adminRoleMainPage.dart';

import 'ServiceDisplayScreen/adminService.dart';


class AdminMainPage extends StatefulWidget {
  final int index;
  AdminMainPage({this.index});
  static const routeName='/admin';

  @override
  _AdminMainPageState createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  List<Widget> homeWidgets = [
    AdminJobMainPage(),
    AdminRoleMainPage(),
    AdminServiceMainPage(),
    Center(child: Text("No history yet!"),)
  ];

  int _navIndex = 0;

  String get title{
    if (_navIndex == 0){
      return 'Jobs';
    }else if(_navIndex ==1){
      return 'Technicians';
    }
    else if(_navIndex ==2){
      return 'Technicians';
    }else{
      return 'History';
    }
  }

  @override
  Widget build(BuildContext context) {
    print('the index is ${_navIndex}');
    return Scaffold(
      appBar: AppBar(
        title: Text('admin'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigator.of(context).pushNamed(
              //   AddUpdateUser.routeName,
              //   arguments: UserArgument(user: this.technician, edit: true),
              // )

            }
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
      drawer: Drawer(
        child:Column(

          children: [
            UserAccountsDrawerHeader(
              accountName: Text('admin'),
              accountEmail: Text('admin@fixit.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.jpg'),
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

            ),
            ListTile(
                leading: Icon(Icons.settings),
                title:Text('settings')
            ),
            // ListTile(
            //   leading: Icon(Icons.favorite),
            //   title: Text('favorite'),
            // ),
            Divider(height: 20,),
            ListTile(
              leading: Icon(Icons.flag),
              title: Text('FAQ'),
            ),
            Divider(height: 20,),
            ListTile(
              trailing: Icon(Icons.close),
              title: Text('close'),
              onTap: (){
                Navigator.of(context).pop();
              },
            )


          ],
        ),

      ),
      body: homeWidgets[_navIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Theme.of(context).accentColor,
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
            _navIndex =index;

          });
        },
      ),
    );
  }
}
