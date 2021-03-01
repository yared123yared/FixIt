import 'package:flutter/material.dart';
const _kTitleTextStyle = TextStyle(
    color: Color(0xffe6020a), fontSize: 24.0, fontWeight: FontWeight.bold);
const _kJobTitleTextStyle = TextStyle(
    color: Color(0xffe602ba), fontSize: 18.0, fontWeight: FontWeight.bold);
const _kJobLocationTextStyle =
TextStyle(color: Colors.green, fontSize: 18.0, fontWeight: FontWeight.bold);
const _kDetailsTextStyle = TextStyle(
    color: Colors.black54, fontSize: 16.0, fontWeight: FontWeight.w500);
class AdminRoleDetail extends StatelessWidget {
  static const routeName='/admin/technician/detail';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('detail'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Material(
          color: Colors.white,
          elevation: 0.0,
          borderRadius: BorderRadius.circular(16.0),
          shadowColor: Color(0x802196F3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Job Detail', style: _kTitleTextStyle),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: buildJobDetail(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Requested By', style: _kTitleTextStyle),
              ),
              Container(child: buildUserDetail(width, height)),
            ],
          ),
        ),
      ),
    );
  }

  //TODO Add user as argument
  Row buildUserDetail(double width, double height) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            // TODO: user image
            backgroundImage:
            AssetImage('assets/images/mec.jpg'),
            radius: width * 0.15,
          ),

          // TODO : user Detail
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "user Name",
                style: _kJobTitleTextStyle,
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
        ]);
  }

  // TODO pass job ass argument
  Widget buildJobDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          // TODO :job title
            child: Text(
              "Candy Bliss",
              style: _kJobTitleTextStyle,
            )),
        Text(
          "Pastries \u00B7 Phoenix,AZ",
          style: _kJobLocationTextStyle,
        ),
        Text(
          'dmmy dismsdjsk kfjdkf kdfj',
          style: _kDetailsTextStyle,
        )
      ],
    );
  }
}
