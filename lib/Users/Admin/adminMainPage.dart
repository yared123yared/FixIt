// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
//
// import 'package:flutter_group_project/drawers/admin_drawer.dart';
//
// class AdminMainPage extends StatefulWidget {
//   static const routeName='/admin';
//
//   @override
//   _AdminMainPageState createState() => _AdminMainPageState();
// }
//
// class _AdminMainPageState extends State<AdminMainPage> {
//   List<Widget> homeWidgets = [
//     AdminJobMainPage(),
//     AdminTechnicianMainPage(),
//     Center(child: Text("No history yet!"),)
//   ];
//
//   int _navIndex = 0;
//
//   String get title{
//     if (_navIndex == 0){
//       return 'Jobs';
//     }else if(_navIndex ==1){
//       return 'Technicians';
//     }else{
//       return 'History';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('the index is ${_navIndex}');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${title}'),
//       ),
//       drawer: NavDrawer(),
//       body: homeWidgets[_navIndex],
//       bottomNavigationBar: CurvedNavigationBar(
//         backgroundColor: Colors.transparent,
//         color: Theme.of(context).accentColor,
//         items: [
//           Icon(Icons.cleaning_services_rounded,color: Colors.white,size: 25.0,),
//           Icon(Icons.supervised_user_circle,color: Colors.white,size: 25.0),
//           Icon(Icons.history,color: Colors.white,size: 25.0),
//         ],
//
//         height: 50,
//         animationDuration: Duration(
//             microseconds: 500
//         ),
//         animationCurve: Curves.bounceOut,
//         onTap: (index){
//           setState(() {
//             _navIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
