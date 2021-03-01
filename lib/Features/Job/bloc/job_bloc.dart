import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Job/repository/job_repository.dart';

import 'job_event.dart';
import 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState>{
  final JobRepository jobRepository;

  JobBloc({@required this.jobRepository})
      : assert(jobRepository != null),
        super(JobLoading());

  @override
  Stream<JobState> mapEventToState(JobEvent event) async* {
    if (event is JobLoad) {
      yield JobLoading();
      try {
        final job = await jobRepository.getJobs();
        yield JobLoadingSuccess(job);
      } catch (_) {
        yield JobOperationFailure();
      }
    }
    if (event is JobCreate) {
      yield JobLoading();
      try {
        await jobRepository.createJob(event.job);
        final job = await jobRepository.getJobs();
        yield JobLoadingSuccess(job);
      } catch (e) {
        print("Error: $e");
        yield JobOperationFailure();
      }
    }

    if (event is JobUpdate) {
      yield JobLoading();
      try {
        await jobRepository.updateJob(event.job);
        final job = await jobRepository.getJobs();
        yield JobLoadingSuccess(job);
      } catch (_) {
        yield JobOperationFailure();
      }
    }
    if (event is JobDelete) {
      yield JobLoading();
      try {
        await jobRepository.deleteJob(event.job.jobId);
        final job = await jobRepository.getJobs();
        yield JobLoadingSuccess(job);
      } catch (e) {
        print("Delete Error: $e");
        yield JobOperationFailure();
      }
    }


  }

  
}