import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/job/models/models.dart';
import 'package:flutter_group_project/Features/job/screens/job_add_update.dart';
import 'package:flutter_group_project/Features/job/screens/job_detail.dart';
import 'package:flutter_group_project/Features/job/screens/job_list.dart';

class JobAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => JobsList());
    }

    if (settings.name == AddUpdateJob.routeName) {
      JobArguments args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AddUpdateJob(
            args: args,
          ));
    }

    if (settings.name == JobDetail.routeName) {
      Job course = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => JobDetail(
            job: course,
          ));
    }

    return MaterialPageRoute(builder: (context) => JobsList());
  }
}

class JobArguments {
  final Job job;
  final bool edit;
  JobArguments({this.job, this.edit});
}
