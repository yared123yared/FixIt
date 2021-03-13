import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Authentication/bloc/auth.dart';
import 'package:flutter_group_project/Features/Authentication/bloc/auth_blocs.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:flutter_group_project/Users/Admin/UserManagement/UserDetail.dart';
import 'login_page.dart';

class CommonDrawerClass extends StatelessWidget {



  @override
  Widget build(BuildContext context)  {
//    Util util= new Util();
//    User user;
//      util.getUserInformation().then((user) {
//      print("Users $user");
////      user = user;
//       });
//
//    print("Users $user");


    return FutureBuilder(
      future: this.getUserInfo(),
      builder: (context,snapshot) {
        if(snapshot.hasData){
          User user=snapshot.data;
          return Drawer(
            child: Column(

              children: [
                UserAccountsDrawerHeader(

                  accountName: Text(user.FullName),
                  accountEmail: Text(user.Email),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("Assets/assets/customer.png"),
                  ),
                  arrowColor: Theme
                      .of(context)
                      .accentColor,
//              decoration: BoxDecoration(
//                gradient: LinearGradient(begin: Alignment.bottomLeft,end: Alignment.topRight,
//                    colors:[Colors.blue,Colors.green]
//                ),
//                // color: Colors.purpleAccent
//              ),

                ),
                ListTile(
                  leading: Icon(Icons.contact_page, color: Theme
                      .of(context)
                      .textTheme
                      .bodyText2
                      .color,),
                  title: Text('Account', style: TextStyle(color: Theme
                      .of(context)
                      .textTheme
                      .bodyText2
                      .color, fontWeight: FontWeight.bold, fontSize: 15),),
                  onTap: () async {
                    Navigator.of(context)
                        .pushNamed(
                        UserDetail.routeName, arguments: user);
                  },

                ),
                // ListTile(
                //   leading: Icon(Icons.favorite),
                //   title: Text('favorite'),
                // ),
                Divider(height: 20,),
                ListTile(
                    leading: Icon(Icons.logout, color: Theme
                        .of(context)
                        .errorColor,),
                    title: Text('Log Out', style: TextStyle(color: Theme
                        .of(context)
                        .errorColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),),
                    onTap: () {
//                Navigator.of(context).pop();
                      BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
                      Navigator.of(context).pushReplacementNamed(
                          SignIn.routeName);
                    }
                ),
                Divider(height: 20,),
                ListTile(
                  trailing: Icon(Icons.close),
                  title: Text('Close', style: TextStyle(color: Theme
                      .of(context)
                      .textTheme
                      .bodyText2
                      .color, fontSize: 15, fontWeight: FontWeight.normal),),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )


              ],
            ),

          );
        }else{
          return Container(
            child: Text("No data"),
          );
        }


      }
    );
  }
//
  Future<User> getUserInfo() async{
    Util util= new Util();
    User user = await util.getUserInformation();
    return user;
  }

//  void _getUserInfo() async {
//
//    Util util= new Util();
//    var snapshot = await util.getUserInformation();
//
//
////    return User(snapshot);
//  }
  }

