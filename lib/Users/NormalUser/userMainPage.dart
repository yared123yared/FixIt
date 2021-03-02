 import 'package:curved_navigation_bar/curved_navigation_bar.dart';
 import 'package:flutter/material.dart';

import 'CategoryDisplayScreen/userCategoryMainPage.dart';

 class UserMain extends StatefulWidget {
   static const routeName='/user';

   @override
   _UserMainState createState() => _UserMainState();
 }

 class _UserMainState extends State<UserMain> {
   List<Widget> homeWidgets = [
     UserCategoryMain(),
     Center(child: Text("No users yet!"),),
     Center(child: Text("No users yet!"),)
   ];

   int _navIndex = 0;

   String get title{
     if (_navIndex == 0){
       return 'category';
     }else if(_navIndex ==1){
       return 'techs';
     }
     else if(_navIndex ==2){
       return 'services';
     }else{
       return 'users';
     }
   }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('user'),
         centerTitle: true,
       ),
       body:homeWidgets[_navIndex],
       drawer: Drawer(
         child:Column(

           children: [
             UserAccountsDrawerHeader(
               accountName: Text('Fasikaw'),
               accountEmail: Text('fasikaw@gmail.com'),
               currentAccountPicture: CircleAvatar(
                 backgroundImage: AssetImage('assets/images/user.jpg'),
               ),
               decoration: BoxDecoration(
                 gradient: LinearGradient(begin: Alignment.bottomLeft,end: Alignment.topRight,
                     colors:[Colors.purple,Colors.purpleAccent] ),
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
             ListTile(
               leading: Icon(Icons.color_lens),
               title: Text('theme'),
             ),
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

       bottomNavigationBar:  CurvedNavigationBar(
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
