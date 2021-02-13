import 'package:flutter/material.dart';
import 'file:///C:/Users/yared/AndroidStudioProjects/flutter_app4/flutter_group_project/lib/Service/Screen/technician_list.dart';
import 'package:flutter_group_project/Screens/drawer.dart';
import 'file:///C:/Users/yared/AndroidStudioProjects/flutter_app4/flutter_group_project/lib/Service/Screen/service_lists.dart';

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
    }else{
      return 'Technicians';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white70,
      body: Container(child: homeWidgets[_navIndex],),
      drawer: NavDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.cleaning_services_rounded),
              label: "Services",
              backgroundColor: Theme.of(context).textTheme.title.color,

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: 'Technicians',
              backgroundColor: Colors.purple
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
              backgroundColor: Colors.purple
          )
        ],
        onTap: (index){
          setState(() {
            _navIndex = index;
          });
        },
      ),
    );
  }
}
