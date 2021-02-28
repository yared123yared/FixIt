import 'package:flutter/material.dart';
import 'package:flutter_group_project/Role/Admin/admin.dart';

class AdminTechnicianMainPage extends StatelessWidget {
  static const routeName='/admin/technician';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AdminTechnicianDetail()));
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: new FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: myDetailsContainer1(),
                        ),
                      ),
                      Container(
                        width: width - 16,
                        height: height * 0.3,
                        padding: EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image.asset(
                            // TODO: change this image path
                            'assets/images/me.jpg',
                            alignment: Alignment.topRight,
                            width: width * 0.2,
                            height: height * 0.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            // TODO
              child: Text(
                "Candy Bliss",
                style: TextStyle(
                    color: Color(0xffe6020a),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        Container(
          // TODO
            child: Text(
              "Pastries \u00B7 Phoenix,AZ",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
