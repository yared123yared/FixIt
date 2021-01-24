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
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return LandscapeView();
          } else {
            return PortraitView();
          }
        },
      ),
      floatingActionButton: CustomFAB(
        onPressed: () {
          Navigator.pushNamed(context, '/goto_map');
        },
      ),
    );
  }
}

class LandscapeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width * 0.5,
            padding: EdgeInsets.all(3.0),
            child: Image(
              image: AssetImage('assets/Images/computer_technician.jpg'),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                TechnicianData(
                  data: "Getachew Tebikew",
                  textStyle: _kTechnicianTextStyle,
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
          ),
        ],
      ),
    );
  }
}

class PortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // height: MediaQuery.of(context).size.height / 2,
          // width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 3.0),
          child: Image(
            image: AssetImage('assets/Images/computer_technician.jpg'),
          ),
        ),
        TechnicianData(
          data: "Getachew Tebikew",
          textStyle: _kTechnicianTextStyle,
        ),
        SingleChildScrollView(
          child: Column(
            children: [
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
        ),
      ],
    );
  }
}
