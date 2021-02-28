import 'package:flutter/material.dart';
import 'package:flutter_group_project/drawer/admin_drawer.dart';
const _kTitleTextStyle = TextStyle(
    color: Color(0xffe6020a), fontSize: 24.0, fontWeight: FontWeight.bold);
const _kServiceTitleTextStyle = TextStyle(
    color: Color(0xffe602ba), fontSize: 18.0, fontWeight: FontWeight.bold);
const _kServiceLocationTextStyle =
TextStyle(color: Colors.green, fontSize: 18.0, fontWeight: FontWeight.bold);
const _kDetailsTextStyle = TextStyle(
    color: Colors.black54, fontSize: 16.0, fontWeight: FontWeight.w500);
class AdminServiceDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Service Detail"),
        centerTitle: true,
      ),

      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Material(
          color: Colors.white,
          elevation: 0.0,
          borderRadius: BorderRadius.circular(16.0),
          shadowColor: Color(0x802196F3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[

              Container(
                margin: EdgeInsets.only(top: 20),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: buildServiceDetail(),
                ),
              ),
              SizedBox(height:100),

              Container(child: buildUserDetail(width, height)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (){},
      ),
    );
  }
  //TODO Add user as argument
  Column buildUserDetail(double width, double height) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:16.0),
              child: Text('Requested By', style: _kTitleTextStyle),
            ),
            SizedBox(width: 50,)
          ],

        ),
        SizedBox(height: 30,),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [

              CircleAvatar(
                // TODO: user image
                backgroundImage:
                AssetImage('assets/images/mec.jpg'),
                radius: width * 0.05,
              ),

              // TODO : user Detail
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "user Name",
                    style: _kServiceTitleTextStyle,
                  ),
                  Row(
                    children: [
                      Icon(Icons.mail),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Email",
                        style: _kDetailsTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "+25190----",
                        style: _kDetailsTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ]),
      ],
    );
  }

  // TODO pass job ass argument
  Widget buildServiceDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: [
            Text('Service Detail', style: _kTitleTextStyle),
            SizedBox(width: 50,)
          ],
        ),
        Container(
          // TODO :job title
            child: Text(
              "Candy Bliss",
              style: _kServiceTitleTextStyle,
            )),
        Text(
          "Pastries \u00B7 Phoenix,AZ",
          style: _kServiceLocationTextStyle,
        ),
        Text(
          'dmmy dismsdjsk kfjdkf kdfj',
          style: _kDetailsTextStyle,
        )
      ],
    );
  }
}
