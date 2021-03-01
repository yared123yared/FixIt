import 'package:equatable/equatable.dart';
import 'package:flutter_group_project/Features/Job/job.dart';
class JobState extends Equatable{
  const JobState();
  @override
  List<Object> get props => [];


}

class JobLoading extends JobState{}

class JobLoadingSuccess extends JobState{
  final List<Job> jobs;

  JobLoadingSuccess([this.jobs = const []]);

  @override
  List<Object> get props => [jobs];
}
class JobOperationFailure extends JobState {

}
