import 'package:flutter/material.dart';

import 'Screens/customer_home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: ThemeData.light().textTheme.copyWith(
          subtitle1: TextStyle(
            color: Colors.purple,
          ),
          bodyText1: TextStyle(
            color:Colors.grey
          ),
            subtitle2: TextStyle(
              color: Colors.pink,
            ),
            bodyText2: TextStyle(

            )
        )
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => CustomerHome(),
      },
    );
  }
}
