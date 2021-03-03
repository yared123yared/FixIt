 import 'package:curved_navigation_bar/curved_navigation_bar.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Authentication/bloc/auth_blocs.dart';
import 'package:flutter_group_project/Features/Authentication/bloc/auth_events.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:flutter_group_project/Users/NormalUser/JobDisplayScreen/userJobMainPage.dart';

import 'CategoryDisplayScreen/userCategoryMainPage.dart';
import 'UserUpdate/Users_main.dart';

 class UserMain extends StatefulWidget {
   static const routeName='/user';
    final User args;
    UserMain({@required this.args});
   @override
   _UserMainState createState() => _UserMainState();
 }

 class _UserMainState extends State<UserMain> {
   List<Widget> homeWidgets = [
     UserCategoryMain(),
     UserJobMain()
   ];

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
     return Scaffold(
       appBar: AppBar(
         title: Text('$title'),
         centerTitle: true,
       ),
       body:homeWidgets[_navIndex],
       drawer:  Drawer(
         child:Column(

           children: [
             UserAccountsDrawerHeader(

               accountName: Text(widget.args.FullName),
               accountEmail: Text(widget.args.Email),
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
                     Users_mainProfile.routeName, arguments: widget.args);
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
                   Navigator.of(context).pop();
                   BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
                   Navigator.of(context).pushReplacementNamed('/');
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

       ),

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
