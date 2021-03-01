import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/Job/data_provider/job_data.dart';
import 'package:flutter_group_project/Features/Job/models/job.dart';


class JobRepository{
  final JobDataProvider dataProvider;

  JobRepository({@required this.dataProvider})
      : assert(dataProvider != null);
  Future<Job> createJob(Job job) async {
    return await dataProvider.createJob(job);
  }
  Future<List<Job>> getJobs() async {
    return await dataProvider.getJobs();
  }
  Future<void> updateJob(Job job) async {
    await dataProvider.updateJob(job);
  }
  Future<void> deleteJob(int id) async {
    await dataProvider.deleteJob(id);
  }

}