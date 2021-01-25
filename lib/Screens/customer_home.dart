import 'package:flutter/material.dart';
import 'package:flutter_group_project/Screens/technician_list.dart';
import 'package:flutter_group_project/Screens/drawer.dart';
import 'package:flutter_group_project/Screens/service_lists.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomerHome extends StatefulWidget {
  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  List<Widget> homeWidgets = [

    ServiceList()
,
    CategoryList(),
    Center(child: Text("No history yet!"),)
  ];
  int _navIndex = 0;
  String get title{
    if (_navIndex == 0){
      return 'Services';
    }else if(_navIndex ==1){
      return 'Technicians';
    }else{
      return 'History';
    }
  }
Color colors = Color(0xfff0e0df);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor:colors,
      body: Container(child: homeWidgets[_navIndex],),
      drawer: NavDrawer(),
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

      )
    );
  }
}

