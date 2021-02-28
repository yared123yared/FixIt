// import "package:flutter/material.dart";
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//
// class BotNavBar extends StatefulWidget {
//    int index;
//   BotNavBar({this.index});
//   @override
//   _BotNavBarState createState() => _BotNavBarState();
// }
//
// class _BotNavBarState extends State<BotNavBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: CurvedNavigationBar(
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
//             widget.index = index;
//           });
//         },
//       ),
//     );
//   }
// }
