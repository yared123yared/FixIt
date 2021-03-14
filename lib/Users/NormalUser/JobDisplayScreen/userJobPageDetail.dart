import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Job/models/models.dart';

import '../userMainPage.dart';
const _kTitleTextStyle = TextStyle(
    color: Color(0xffe6020a), fontSize: 18.0, fontWeight: FontWeight.bold);
const _kJobTitleTextStyle = TextStyle(
    color: Color(0xffe602ba), fontSize: 18.0, fontWeight: FontWeight.bold);
const _kJobLocationTextStyle =
TextStyle(color: Colors.green, fontSize: 18.0, fontWeight: FontWeight.bold);
const _kDetailsTextStyle = TextStyle(
    color: Colors.black54, fontSize: 16.0, fontWeight: FontWeight.w500);
const _kStatusTextStyle = TextStyle(
    color: Colors.pink, fontSize: 18.0, fontWeight: FontWeight.w500);

class UserJobDetail extends StatelessWidget {
  static const routeName='/user/job/detail';
  final Job job;

  UserJobDetail({this.job});
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
                        child: buildJobDetail(job),
                      ),
                    ),
                    SizedBox(height: 5),

                    SizedBox(height: 5),
                    Container(child: buildTechnicianDetail(
                        width, height, job.technician, job.technician.user)),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.check_circle_sharp,
                  ),
              backgroundColor: job.doneStatus == "done" ? Colors.grey : Colors.green,
              onPressed: () async {
                final event = job.doneStatus =='done'? JobUpdate(
                  Job(
                      jobId: job.jobId,
                      jobName: job.jobName,
                      description:job.description,
                      userId: job.userId,
                      location: job.location,
                      technicianId: job.technicianId,
                      acceptanceStatus:job.acceptanceStatus!=null? job.acceptanceStatus: null,
                      doneStatus: null
                  ),
                ):  JobUpdate(
                  Job(
                      jobId: job.jobId,
                      jobName: job.jobName,
                      description:job.description,
                      userId: job.userId,
                      location: job.location,
                      technicianId: job.technicianId,
                      acceptanceStatus:job.acceptanceStatus!=null? job.acceptanceStatus: null,
                      doneStatus: "done"
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
  // TODO pass job ass argument
  Widget buildJobDetail(Job job) {
    var addressArray = job.location.split(",").sublist(2);

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
                Text(
                  "$address",
                  style: TextStyle(),
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
                      style: _kStatusTextStyle),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Done Status: ${job.doneStatus}',
                    style: _kStatusTextStyle,
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


  Card buildTechnicianDetail(double width, double height, Technician technician, User user) {
    return Card(
      child: Row(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 5,bottom: 30),
                child: Text('Assigned To', style: _kTitleTextStyle,overflow: TextOverflow.fade,),
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
                      "${technician.user.fullName}",
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
