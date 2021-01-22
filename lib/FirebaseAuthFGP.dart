
import 'package:flutter/material.dart';
import 'package:flutter_group_project/Screens/login_page.dart';
import 'package:flutter_group_project/Screens/signup_page.dart';

class FirebaseAuthFGP extends StatefulWidget {
  @override
  _FirebaseAuthFGPState createState() => _FirebaseAuthFGPState();
}

class _FirebaseAuthFGPState extends State<FirebaseAuthFGP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Auth"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: OutlineButton(
              child: Text("Signin"),
              onPressed: () => _pushPage(context, SignIn()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
          Container(
            child: OutlineButton(
              child: Text("Register"),
              onPressed: () => _pushPage(context, Register()),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
}