import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_project/Users/Admin/JobDisplayScreen/adminJobMainPage.dart';

import 'package:flutter_group_project/drawers/admin_drawer.dart';

class AdminMainPage extends StatefulWidget {
  static const routeName='/admin';

  @override
  _AdminMainPageState createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  List<Widget> homeWidgets = [
    AdminJobMainPage(),
    AdminRoleMainPage(),
    Center(child: Text("No history yet!"),)
  ];

  int _navIndex = 0;

  String get title{
    if (_navIndex == 0){
      return 'Jobs';
    }else if(_navIndex ==1){
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
        title: Text('${title}'),
      ),
      drawer: Drawer(
        child:Column(

          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Fasikaw'),
              accountEmail: Text('fasikaw@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.jpg'),
              ),
              arrowColor: Colors.purple,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomLeft,end: Alignment.topRight,
                    colors:[Colors.blue,Colors.green] ),
                // color: Colors.purpleAccent
              ),

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
