import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/Job/models/models.dart';
import 'package:http/http.dart' as http;
class JobDataProvider{
  final _baseUrl = "http://192.168.137.1:5001/api/jobs";
  final http.Client  httpClient;


  JobDataProvider({@required this.httpClient}) : assert(httpClient != null);
  Future<Job> createJob(Job job) async {
    print("creating job");
      print('job: $job');
      final response = await httpClient.post(
        Uri.http('192.168.137.1:5001','/api/jobs'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'jobName': job.jobName,
          'description': job.description,
          'userId': job.userId,
          'location': job.location,
          'technicianId': job.technicianId,
          'accepteStatus': job.acceptanceStatus,
          'doneStatus':job.doneStatus
        }),
      );

      print("response: ${response.body}");
      if (response.statusCode == 200) {
        print('Creating the jobs');
        return Job.fromJsonCreate(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create job.');
      }
    }


  Future<List<Job>> getJobs() async {
    print("Getint all the jobs");
    final response = await httpClient.get('$_baseUrl');

    if (response.statusCode == 200) {
      final jobs = jsonDecode(response.body) as List;
      print(jobs);
      List<Job> lists = jobs.map((job) => Job.fromJson(job)).toList();
      print(lists);

      return jobs.map((course) => Job.fromJson(course)).toList();
    } else {
      throw Exception('Failed to load job');
    }
  }

  Future<void> deleteJob(int id) async {
    final http.Response response = await httpClient.delete(
      '$_baseUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );


    if (response.statusCode != 200) {
      throw Exception('Failed to delete job.');
    }
  }


  Future<void> updateJob(Job job) async {
    final http.Response response = await httpClient.put(
      '$_baseUrl/${job.jobId}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: jsonEncode(<String, dynamic>{
        'JobId':job.jobId,
        'JobName': job.jobName,
        'Description': job.description,
        'UserId': job.userId,
        'Location': job.location,
        'TechnicianId': job.technicianId,
        'accepteStatus': job.acceptanceStatus,
        'DoneStatus':job.doneStatus
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update job.');
    }
  }


}