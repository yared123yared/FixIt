import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Service/Screen/screens.dart';
import 'package:flutter_group_project/Features/job/screens/screens.dart';



class AdminUserDetail extends StatelessWidget {
  static const routeName = 'jobDetail';
  final User job;

  JobDetail({@required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.job.jobName}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateJob.routeName,
              arguments: JobArguments(job: this.job, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<JobBloc>().add(JobDelete(this.job));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    JobsList.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Job:  ${this.job.jobName}'),
              subtitle: Text('location:  ${this.job.location}'),
            ),
            Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),


            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Acceptance Status: ',style: TextStyle(fontSize: 20.0,),),
                      Text(this.job.acceptanceStatus),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Done Status: ',style: TextStyle(fontSize: 20.0),),
                      Text(this.job.doneStatus),
                    ],

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Description: ',style: TextStyle(fontSize: 20.0),),
                      Expanded(child: Text(this.job.description)),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
