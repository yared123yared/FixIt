import 'package:flutter/material.dart';

class TechnicianData extends StatelessWidget {
  final String data;
  final IconData icon;
  final TextStyle textStyle;
  TechnicianData({
    @required this.data,
    this.icon,
    this.textStyle,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // subtitle: Text('you can do this'),
      leading: Icon(
        icon,
        color: Colors.amber,
      ),
      title: Text(
        data,
        style: textStyle,
      ),
    );
  }
}
