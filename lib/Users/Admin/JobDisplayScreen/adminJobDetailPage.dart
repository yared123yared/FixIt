import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/Job/bloc/bloc.dart';
import 'package:flutter_group_project/Features/job/models/models.dart';
import 'package:flutter_group_project/Features/job/screens/job_detail.dart';

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

class AdminJobDetail extends StatelessWidget {
  static const routeName= '/admin/Features.job/detail';
  final Job job;
  AdminJobDetail({this.job});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
              SizedBox(height:5),
              Container(child: buildUserDetail(width, height,job.user)),
              SizedBox(height:5),
              Container(child: buildTechnicianDetail(width, height,job.technician,job.technician.user)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () async{
          await context.read<JobBloc>().add(JobDelete(this.job));
          Navigator.of(context).pop();
          // AdminJobMainPage.routeName, (route) => false);

        },
      ),
    );;
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
  Column buildUserDetail(double width, double height,User user) {
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
                AssetImage('Assets/Images/mec.jpg'),
                radius: width * 0.1,
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
                ],
              ),
            ]),
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
