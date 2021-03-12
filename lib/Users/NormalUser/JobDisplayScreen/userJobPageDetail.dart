import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Job/models/models.dart';

import '../userMainPage.dart';
const _kTitleTextStyle = TextStyle(
    color: Color(0xffe6020a), fontSize: 24.0, fontWeight: FontWeight.bold);
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
              backgroundColor: job.doneStatus == "done" ? Colors.green : Colors.grey,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: [
            Text('Job Detail', style: _kTitleTextStyle),
            SizedBox(width: 50,)
          ],
        ),

        Row(
          children: [
            Text("Name: ",style: _kDetailsTextStyle,),
            SizedBox(
              width: 15,
            ),
            Text(
              "${job.jobName}",
            ),
          ],
        ),Row(
          children: [
            Text("location: ",style: _kDetailsTextStyle,),
            SizedBox(
              width: 15,
            ),
            Text(
              "${job.location}",
            ),
          ],
        ),
        Row(
          children: [
            Text(
                'Done Status: ${job.doneStatus}',
                style: _kStatusTextStyle
            ),
          ],
        ),
        Row(
          children: [
            Text(
                'accept status: ${job.acceptanceStatus}',
                style: _kStatusTextStyle
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Description: ${job.description}',
              style: _kDetailsTextStyle,
            ),
          ],
        ),

      ],
    );
  }

  Column buildTechnicianDetail(double width, double height,Technician technician,User user) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:16.0),
              child: Text('Assigned to', style: _kTitleTextStyle),
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
                AssetImage('Assets/Images/mec.jpg'),
                radius: width * 0.10,
              ),

              // TODO : user Detail
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
                  Row(
                    children: [
                      Icon(Icons.category_sharp),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "${technician.department}",
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
