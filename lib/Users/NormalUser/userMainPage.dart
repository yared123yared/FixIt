// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_group_project/drawers/user_drawer.dart';
//
// class UserMain extends StatefulWidget {
//   static const routeName='/user';
//
//   @override
//   _UserMainState createState() => _UserMainState();
// }
//
// class _UserMainState extends State<UserMain> {
//   int _navIndex= 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('user'),
//         centerTitle: true,
//       ),
//       drawer: NavDrawer(),
//
//       bottomNavigationBar:  CurvedNavigationBar(
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
