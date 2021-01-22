import 'package:flutter/material.dart';

import 'Screens/Category_main_screen.dart';
import 'Screens/Customer_main_screen.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {








  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          errorColor:Colors.red,
          canvasColor: Color.fromRGBO(225, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 31, 51, 1),
              ),
              headline6: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed'
              )

          )
      ),

      initialRoute: CategoryMainScreen.routeName,
      routes: {
        CategoryMainScreen.routeName: (ctx)=>CategoryMainScreen(),
        '/customer' : (ctx)=>CustomerMainScreen(),
        '/customerr' : (ctx)=>CustomerMainScreen(),
        '/customerrd' : (ctx)=>CustomerMainScreen(),




      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=>CategoryMainScreen());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('Navigation Time!'),
      ),
    );

  }
}