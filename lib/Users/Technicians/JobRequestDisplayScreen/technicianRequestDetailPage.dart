import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Job/models/job.dart';

const _kTitleTextStyle = TextStyle(
    color: Color(0xffe6020a), fontSize: 24.0, fontWeight: FontWeight.bold);
const _kJobTitleTextStyle = TextStyle(
    color: Color(0xffe602ba), fontSize: 18.0, fontWeight: FontWeight.bold);
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: buildJobDetail(job),
                  ),
                ),
                Container(child: buildUserDetail(width, height, job.user)),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.check_circle_sharp,
          ),
          backgroundColor:
              job.doneStatus == "done" ? Colors.green : Colors.grey,
          onPressed: () async {
            final event = job.doneStatus == 'done'
                ? JobUpdate(
                    Job(
                        jobId: job.jobId,
                        jobName: job.jobName,
                        description: job.description,
                        userId: job.userId,
                        location: job.location,
                        technicianId: job.technicianId,
                        acceptanceStatus: job.acceptanceStatus != null
                            ? job.acceptanceStatus
                            : null,
                        doneStatus: null),
                  )
                : JobUpdate(
                    Job(
                      jobId: job.jobId,
                      jobName: job.jobName,
                      description: job.description,
                      userId: job.userId,
                      location: job.location,
                      technicianId: job.technicianId,
                      acceptanceStatus: " Accepted ",
                      doneStatus:
                          job.doneStatus == null ? "not done" : job.doneStatus,
                    ),
                  );
            await context.read<JobBloc>().add(event);
            Navigator.of(context).pop();
//                Navigator.of(context).pushAndRemoveUntil(UserMain.routeName, (route) => false);
            // AdminJobMainPage.routeName, (route) => false);
          },
        ),
      );
    });
  }

  Widget buildJobDetail(Job job) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Job Detail', style: _kTitleTextStyle),
        Container(
          padding: EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Job Name: ${job.jobName}", style: _kStatusTextStyle),
              Text("location: ${job.location}", style: _kStatusTextStyle),
              Text('Done Status: ${job.doneStatus}', style: _kStatusTextStyle),
              Text('accept status: ${job.acceptanceStatus}',
                  style: _kStatusTextStyle),
              Text('Description: ${job.description}', style: _kStatusTextStyle),
            ],
          ),
        ),
      ],
    );
  }

  Column buildUserDetail(double width, double height, User user) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
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
                backgroundImage: AssetImage('Assets/Images/mec.jpg'),
                radius: width * 0.1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user.fullName}",
                    style: _kJobTitleTextStyle,
                  ),
                  Row(
                    children: [
                      Icon(Icons.mail),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "${user.email}",
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
                        "${user.phone}",
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
}
