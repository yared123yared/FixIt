import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/job/bloc/job_bloc.dart';
import 'package:flutter_group_project/job/bloc/job_state.dart';
import 'package:flutter_group_project/job/screens/job_add_update.dart';
import 'package:flutter_group_project/job/screens/job_detail.dart';
import 'package:flutter_group_project/job/screens/job_route.dart';

import '../../bot_nav_bar.dart';
import '../../user_drawer.dart';

class JobsList extends StatelessWidget {
  int _index = 0;
  static const routeName = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Jobs"),
        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: BlocBuilder<JobBloc, JobState>(
        builder: (_, state) {
          if (state is JobOperationFailure) {
            return Text('Could not do job operation');
          }
          if (state is JobLoadingSuccess) {
            final jobs = state.jobs;

            return ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (_, idx) => Card(
                margin: EdgeInsets.all(5),
                elevation: 5.0,
                child: ListTile(
                  title: Text('${jobs[idx].jobName}'),
                  subtitle: Text('${jobs[idx].description}'),
                  trailing: Text('${jobs[idx].location}'),
                  onTap: () => Navigator.of(context)
                      .pushNamed(JobDetail.routeName, arguments: jobs[idx]),
                ),
              ),
            );
          }

          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(child: CircularProgressIndicator(

            ),),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AddUpdateJob.routeName,
          arguments: JobArguments(edit: false),
        ),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BotNavBar(index: _index,),
    );
  }
}
