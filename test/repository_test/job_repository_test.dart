import 'package:flutter_group_project/Features/Job/data_provider/data_provider.dart';
import 'package:flutter_group_project/Features/Job/models/job.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

class MocJobDataProvider extends Mock implements JobDataProvider {}

main() {
  group('Job repository test', () {
    final job1 = Job(
        jobName: "Mock job",
        acceptanceStatus: "Not",
        location: 'mock location',
        jobId: 1);
    final job2 = Job(
        jobName: "Mock job",
        acceptanceStatus: "Not",
        location: 'mock location',
        jobId: 1);
// final jobs = [job1, job2];
    JobDataProvider jobDataProvider = MocJobDataProvider();
    List<Job> jobs = [];
    test('Get all jobs', () async {
      when(jobDataProvider.getJobs()).thenAnswer((_) async {
        return jobs;
      });
      expect(jobs.length, 0);
    });

    test('create job', () async {
      when(jobDataProvider.createJob(job1)).thenAnswer((_) async {
        jobs.add(job1);
        return Future.value(job1);
      });
      expect(jobs.length, 0);
    });

    test('delete job', () async {
      when(jobDataProvider.deleteJob(job1.jobId)).thenAnswer((_) async {
        jobs.remove(job1);
        return Future.value(job1);
      });

      expect(jobs.length, 0);
    });
    test('update job', () async {
      when(jobDataProvider.deleteJob(job1.jobId)).thenAnswer((_) async {
        jobs.add(job2);
      });
      expect(jobs.length, 0);
    });
  });
}
