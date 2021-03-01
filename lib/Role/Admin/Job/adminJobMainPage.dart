import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/job/screens/job_list.dart';

class AdminJobMainPage extends StatelessWidget {
  static const routeName='/admin/Features.job';
  @override
  Widget build(BuildContext context) {
    return JobsList();
  }
}
