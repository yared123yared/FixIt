import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/job/models/models.dart';
import 'package:flutter_group_project/Features/job/screens/job_detail.dart';

class AdminJobDetail extends StatelessWidget {
  static const routeName= '/admin/Features.job/detail';
  final Job job;
  AdminJobDetail({this.job});
  @override
  Widget build(BuildContext context) {
    return JobDetail(job: job);
  }
}
