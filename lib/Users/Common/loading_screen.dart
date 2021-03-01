import 'package:flutter/material.dart';

class loading_screen extends StatelessWidget {//Screen for loading event handling
  final String title;

  loading_screen({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
