import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/Technician/models/models.dart';
import 'package:flutter_group_project/ScreenRoute.dart';
import 'package:flutter_group_project/Users/NormalUser/JobDisplayScreen/userJobCreatePage.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
const _kTitleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const _kTechnicianNameStyle = TextStyle(
  color: Colors.green,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const _kIconColor = Colors.green;
class UserTechnicianDetail extends StatelessWidget {
  static const routeName = '/user/category/services/technicians/detail';
  final Technician technician;

  const UserTechnicianDetail({Key key, this.technician}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPortraitView(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(UserCreateJob.routeName,arguments: JobArguments(edit: false,technicianId: technician.technicianId));
        },
      ),
    );
  }
  Widget _buildPortraitView(BuildContext context) {
    var divider = Container(
      height: 2,
      width: double.infinity,
      color: Colors.grey[300],
      margin: EdgeInsets.symmetric(horizontal: 10),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        _builPhoto(context),
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: CustomButton(
                  label: 'Profile',
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
              ),
              Expanded(
                child: CustomButton(
                  label: 'Views',
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ),
        _aboutSection(technician),
        divider,
        Container(child: _buildWorkSection(context)),
        divider,
        _buildPortifolioSection(context),
        Expanded(
          child: Container(),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            child: CustomButton(
              label: 'hire ${technician.user.fullName}',
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
  Container _builPhoto(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.38,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image(
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              image: AssetImage('Assets/Images/civ.jpg'),
            ),
          ),
          Positioned(
            left: 0,
            top: 20,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: _kIconColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            right: 0,
            top: 20,
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                color: _kIconColor,
              ),
              onPressed: () {},
            ),
          ),
          Positioned(
            left: 20,
            top: MediaQuery.of(context).size.height * 0.10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  maxRadius: MediaQuery.of(context).size.width * 0.15,
                  // minRadius: MediaQuery.of(context).size.width * 0.4,
                  backgroundImage:
                  AssetImage('Assets/Images/computer_technician.jpg'),
                ),
                Text(
                  "${technician.user.fullName}",
                  style: _kTechnicianNameStyle,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.send,
                      color: Colors.blue,
                    ),
                    Text('@${technician.department}')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
Widget _aboutSection(Technician technician) {
  return Container
(
  margin: EdgeInsets.all(10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'About',
        style: _kTitleStyle,
      ),
      Text(
          "Hi I'm ${technician.user.fullName} a ${technician.department} Expert from ${technician.user.address}. I can do Almost every Thing."),
    ],
  ),
);
}

Widget _buildWorkSection(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 12),
    height: 120,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildWorkDetail(
              context,
              _buildCircularStepProgressIndicator(context, currentStep: 20),
              'Completed \nworks'),
          _buildWorkDetail(
              context,
              _buildCircularStepProgressIndicator(context, currentStep: 40),
              'On Budget\n Rate'),
          _buildWorkDetail(
              context,
              _buildCircularStepProgressIndicator(context, currentStep: 60),
              'On Time \nRate'),
          _buildWorkDetail(
              context,
              _buildCircularStepProgressIndicator(context, currentStep: 80),
              'Hire\n Rate'),
        ],
      ),
    ),
  );
}

Widget _buildWorkDetail(BuildContext context,
    CircularStepProgressIndicator circularStepProgressIndicator, String label) {
  return Expanded(
    child: Column(
      children: [
        circularStepProgressIndicator,
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
CircularStepProgressIndicator _buildCircularStepProgressIndicator(
    BuildContext context,
    {@required int currentStep}) {
  var circleHeight = MediaQuery.of(context).size.width / 6;
  var circleWidth = MediaQuery.of(context).size.width / 6;
  return CircularStepProgressIndicator(
    currentStep: currentStep,
    totalSteps: 100,
    startingAngle: 360,
    unselectedColor: Colors.white,
    selectedColor: Colors.blueAccent,
    child: Center(child: Text('40%')),
    height: circleHeight,
    width: circleWidth,
  );
}
Widget _buildPortifolioSection(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: [
        Text(
          'Portifolio',
          style: _kTitleStyle,
        ),
      ],
    ),
  );
}
class CustomButton extends StatelessWidget {
  final Function onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final String label;

  const CustomButton(
      {this.onTap, this.backgroundColor, this.foregroundColor, this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Colors.blueAccent,
              width: 2,
            )),
        child: Center(
          child: Text(label,
              style: TextStyle(
                color: foregroundColor,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      onTap: onTap,
    );
  }
}

