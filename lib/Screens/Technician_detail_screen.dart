import 'package:flutter/material.dart';
import 'package:flutter_group_project/Widgets/CustomFAB.dart';
import 'package:flutter_group_project/Widgets/Technician_data.dart';

const _kTechnicianTextStyle = TextStyle(
  color: Colors.green,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

class TechnicianDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Technician Detail"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // height: MediaQuery.of(context).size.height / ,
            padding: EdgeInsets.symmetric(vertical: 3.0),
            child: Image(
              image: AssetImage('assets/Images/computer_technician.jpg'),
            ),
          ),
          TechnicianData(
            data: "Getachew Tebikew",
            textStyle: _kTechnicianTextStyle,
          ),
          TechnicianData(
            data: "Email@example.com",
            icon: Icons.email,
            textStyle: _kTechnicianTextStyle,
          ),
          TechnicianData(
            data: "+25199-099-9090",
            icon: Icons.phone,
            textStyle: _kTechnicianTextStyle,
          ),
        ],
      ),
      floatingActionButton: CustomFAB(
        onPressed: () {
          print("ello");
          Navigator.pushNamed(context, '/goto_map');
        },
      ),
    );
  }
}
