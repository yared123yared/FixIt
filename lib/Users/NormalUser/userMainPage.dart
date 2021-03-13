 import 'package:curved_navigation_bar/curved_navigation_bar.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Authentication/bloc/auth_blocs.dart';
import 'package:flutter_group_project/Features/Authentication/bloc/auth_events.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:flutter_group_project/Users/Common/drawer.dart';
import 'package:flutter_group_project/Users/NormalUser/JobDisplayScreen/userJobMainPage.dart';

import 'CategoryDisplayScreen/userCategoryMainPage.dart';
import 'UserUpdate/Users_main.dart';

 class UserMain extends StatefulWidget {
   static const routeName='/user';
//    final User args;
//    UserMain({@required this.args});
   @override
   _UserMainState createState() => _UserMainState();
 }

 class _UserMainState extends State<UserMain> {

   List<Widget> homeWidgets;

   int _navIndex = 0;

   String get title{
     if (_navIndex == 0){
       return 'category';
     }else{
       return 'history';
     }
   }
   @override
   Widget build(BuildContext context) {
     homeWidgets = [
     UserCategoryMain(),
     UserJobMain()
     ];


     return Scaffold(
       appBar: AppBar(
         title: Text('$title'),
         centerTitle: true,
       ),
       body:homeWidgets[_navIndex],
       drawer:  CommonDrawerClass(),

       bottomNavigationBar:  CurvedNavigationBar(
         backgroundColor: Colors.transparent,
         color: Theme.of(context).accentColor,
         items: [
           Icon(Icons.cleaning_services_rounded,color: Colors.white,size: 25.0,),
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
