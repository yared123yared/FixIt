import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/job_bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/job_event.dart';
import 'package:flutter_group_project/Features/Job/bloc/job_state.dart';
import 'package:flutter_group_project/Features/Job/models/job.dart';

const _kTitleTextStyle = TextStyle(
    color: Color(0xffe6020a), fontSize: 24.0, fontWeight: FontWeight.bold);
const _kJobTitleTextStyle = TextStyle(
    color: Color(0xffe602ba), fontWeight: FontWeight.bold);
const _kJobLocationTextStyle =
    TextStyle(color: Colors.green, fontSize: 18.0, fontWeight: FontWeight.bold);
const _kDetailsTextStyle = TextStyle(
    color: Colors.black54, fontSize: 16.0, fontWeight: FontWeight.w500);
const _kStatusTextStyle =
    TextStyle(color: Colors.pink, fontSize: 18.0, fontWeight: FontWeight.w500);

class AdminJobDetail extends StatelessWidget {
  static const routeName = '/admin/Features.job/detail';
  final Job job;
  AdminJobDetail({this.job});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<JobBloc, JobState>(builder: (_, state) {
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
                Container(child: buildUserDetail(width, height, job.user)),
                SizedBox(height: 15),
                Container(
                    child: buildTechnicianDetail(
                        width, height, job.technician, job.technician.user)),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () async {
            await context.read<JobBloc>().add(JobDelete(this.job));
            Navigator.of(context).pop();
            // AdminJobMainPage.routeName, (route) => false);
          },
        ),
      );
    });
  }

  // TODO pass job ass argument
  Widget buildJobDetail(Job job) {
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
                  "${job.location}",
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
                      style: _kJobTitleTextStyle,
                    ),
                  ],
                ),
              ]),
        ],
      ),
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
                child: Text('Assigned To', style: _kTitleTextStyle),
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
