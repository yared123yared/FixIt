import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Job/models/job.dart';
import 'package:flutter_group_project/ScreenRoute.dart';
import 'package:flutter_group_project/Users/NormalUser/JobDisplayScreen/map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const _kTitleTextStyle = TextStyle(
    color: Color(0xffe6020a), fontSize: 18.0, fontWeight: FontWeight.bold);
const _kJobTitleTextStyle = TextStyle(
    color: Color(0xffe602ba), fontSize: 15.0, fontWeight: FontWeight.bold);
const _kJobLocationTextStyle =
TextStyle(color: Colors.green, fontSize: 18.0, fontWeight: FontWeight.bold);
const _kDetailsTextStyle = TextStyle(
    color: Colors.black54, fontSize: 16.0, fontWeight: FontWeight.w500);
const _kStatusTextStyle =
TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);

class TechnicianRequestDetail extends StatelessWidget {
  static const routeName = '/technician/request/detail';
  final Job job;
  TechnicianRequestDetail({this.job});
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<JobBloc,JobState>(
        builder: (_,state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("${this.job.jobName}"),
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
                        child: buildJobDetail(job,context),
                      ),
                    ),
                    SizedBox(height: 5),

                    SizedBox(height: 5),
                    Container(child: buildUserDetail(
                        width, height, job.technician.user)),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.check_circle_sharp,
              ),
              backgroundColor: job.acceptanceStatus.trim().toLowerCase() == "accepted" ? Colors.green : Colors.grey,
              onPressed: () async {
                final event = job.acceptanceStatus =='accepted'? JobUpdate(
                  Job(
                      jobId: job.jobId,
                      jobName: job.jobName,
                      description:job.description,
                      userId: job.userId,
                      location: job.location,
                      technicianId: job.technicianId,
                      acceptanceStatus:"waiting",
                      doneStatus: job.doneStatus
                  ),
                ):  JobUpdate(
                  Job(
                      jobId: job.jobId,
                      jobName: job.jobName,
                      description:job.description,
                      userId: job.userId,
                      location: job.location,
                      technicianId: job.technicianId,
                      acceptanceStatus:"accepted",
                      doneStatus: job.doneStatus != null? job.doneStatus : "not done"
                  ),
                );
                await context.read<JobBloc>().add(
                    event
                );
                Navigator.of(context).pop();
//                Navigator.of(context).pushAndRemoveUntil(UserMain.routeName, (route) => false);
                // AdminJobMainPage.routeName, (route) => false);

              },
            ),
          );
        }
    );
  }

  Widget buildJobDetail(Job job,BuildContext context) {
    var addressArray = job.location.split(",").sublist(2);
    LatLng location=LatLng(double.parse(job.location.split(",")[0]), double.parse(job.location.split(",")[1]));

    var address = '${addressArray[0]}, ${addressArray[1]}, ${addressArray[2]}';

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Card(
          margin: EdgeInsets.only(bottom: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          elevation: 5.0,
          borderOnForeground: true,
          shadowColor: Colors.grey,
          child: Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 40.0),
            child: Column(
              children: [
                Text(
                  "${job.jobName}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.location_on,color: Colors.blue),
                      onPressed: (){
                        Navigator.of(context).pushNamed(
                          MapScreen.routeName,
                          arguments: MapArgument(
                            location: location,
                            isUser: false,
                          )
                        );
                      },
                    ),
                    Text(
                      "$address",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.only(bottom: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5.0,
          borderOnForeground: true,
          shadowColor: Colors.grey,
          child: Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('Accept Status: ${job.acceptanceStatus}',
                      style: _kTitleTextStyle),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Done Status: ${job.doneStatus}',
                    style: _kTitleTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description ',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              child: Text(
                '${job.description} ',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,

              ),
            ),
          ],
        ),
      ],
    );
  }

  Card buildUserDetail(double width, double height, User user) {
    return Card(
      child: Row(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 5,bottom: 30),
                child: Text('Requested By', style: _kTitleTextStyle),
              ),
              SizedBox(
                width: 50,
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  // TODO: user image
                  backgroundImage: AssetImage('Assets/Images/me.jpg'),
                  radius: width * 0.07,
                ),
                SizedBox(width: 5,),
                // TODO : user Detail
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.fullName}",
                      overflow: TextOverflow.ellipsis,
                      style: _kJobTitleTextStyle,
                    ),
                  ],
                ),
              ]),
        ],
      ),
    );
  }
}

