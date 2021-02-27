import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_group_project/FirebaseAuthFGP.dart';

import 'Screens/login_page.dart';
import 'User/Screen/User_main_screen.dart';


Future<void >main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: SignIn(),
      // home: CategoryMainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
