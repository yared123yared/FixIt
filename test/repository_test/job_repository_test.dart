import 'package:flutter_group_project/Features/Job/data_provider/job_data.dart';
import 'package:flutter_group_project/Features/Job/models/job.dart';
import 'package:flutter_group_project/Features/Job/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MocJobDataProvider extends Mock implements JobDataProvider {}

main() {
  group('Job repository test', () {
    final job1 = Job(
        jobName: "Mock job",
        acceptanceStatus: "Not",
        location: 'mock location',
        jobId: 1);
        JobDataProvider serviceDataProvider = MocJobDataProvider();
    JobRepository serviceRepository =
        JobRepository(dataProvider: serviceDataProvider);
//     List<Job> Jobs = [];
    test('get all Jobs', () async {
      when(serviceRepository.getJobs()).thenAnswer((_) async {
        return Future.value();
      });

      serviceRepository.getJobs();

      verify(serviceRepository.getJobs()).called(1);
    });

    test('create Job', () async {
      when(serviceRepository.createJob(job1)).thenAnswer((_) async {
        return Future.value();
      });

      serviceRepository.createJob(job1);

      verify(serviceRepository.createJob(job1)).called(1);
    });

    test('delete Job', () async {
      when(serviceRepository.deleteJob(job1.jobId)).thenAnswer((_) async {
        return Future.value();
      });

      serviceRepository.deleteJob(job1.jobId);

      verify(serviceRepository.deleteJob(job1.jobId)).called(1);
    });

    test('update Job', () async {
      when(serviceRepository.updateJob(job1)).thenAnswer((_) async {
        return Future.value();
      });

      serviceRepository.updateJob(job1);

      verify(serviceRepository.updateJob(job1)).called(1);
    });
  });
}
