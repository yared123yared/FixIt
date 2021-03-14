import 'package:flutter/material.dart';
import 'package:flutter_group_project/Users/Common/drawer.dart';

import 'JobRequestDisplayScreen/technicianRequestMainPage.dart';

class TechnicianMainPage extends StatelessWidget {
  static const routeName='/technician/mainPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Technicain"),
        centerTitle: true,
      ),
      drawer:  CommonDrawerClass(),
      body: TechnicianRequestMain(),
    );
  }
}
