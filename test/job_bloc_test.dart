import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_group_project/Features/Job/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/job_bloc.dart';
import 'package:flutter_group_project/Features/Job/job.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockJobRepository extends Mock implements JobRepository {}

void main() {
  test('throws AssertionError if ServiceRepository is null', () {
    expect(
      () => JobBloc(jobRepository: null),
      throwsA(isAssertionError),
    );
  });

  JobRepository jobRepository = MockJobRepository();
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
  final jobs = [job1, job2];

  blocTest(
    'getJobs [JobLoading, JobLodingSuccess] when successful',
    build: () {
      when(jobRepository.getJobs()).thenAnswer((_) async => jobs);
      return JobBloc(jobRepository: jobRepository);
    },
    act: (bloc) => bloc.add(JobLoad()),
    expect: [JobLoading(), JobLoadingSuccess(jobs)],
  );
  blocTest(
    'createJob [JobLoading, JobLodingSuccess] when successful',
    build: () {
      when(jobRepository.createJob(job1)).thenAnswer((_) async => job1);
      return JobBloc(jobRepository: jobRepository);
    },
    act: (bloc) => bloc.add(JobLoad()),
    expect: [JobLoading(), JobLoadingSuccess(jobs)],
  );
  blocTest(
    'deleteJob [JobLoading, JobLodingSuccess] when successful',
    build: () {
      when(jobRepository.deleteJob(job1.jobId)).thenAnswer((_) async => {});
      return JobBloc(jobRepository: jobRepository);
    },
    act: (bloc) => bloc.add(JobLoad()),
    expect: [JobLoading(), JobLoadingSuccess(jobs)],
  );
  blocTest(
    'updateJob [JobLoading, JobLodingSuccess] when successful',
    build: () {
      when(jobRepository.updateJob(job1)).thenAnswer((_) async => jobs);
      return JobBloc(jobRepository: jobRepository);
    },
    act: (bloc) => bloc.add(JobLoad()),
    expect: [JobLoading(), JobLoadingSuccess(jobs)],
  );
}
