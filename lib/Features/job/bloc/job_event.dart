import 'package:equatable/equatable.dart';
import 'package:flutter_group_project/Features/job/models/models.dart';


abstract class JobEvent extends Equatable{
      const JobEvent();
}

class JobLoad extends JobEvent{
  const JobLoad();

  @override
  List<Object> get props => [];

}
class JobCreate extends JobEvent {
  final Job job;

  const JobCreate (this.job);

  @override
  List<Object> get props => [job];

  @override
  String toString() => 'job Created {job: $job}';
}
class JobUpdate extends JobEvent {
  final Job job;

  const JobUpdate(this.job);

  @override
  List<Object> get props => [job];

  @override
  String toString() => 'job Updated {job: $job}';
}
class JobDelete extends JobEvent {
  final Job job;

  const JobDelete(this.job);

  @override
  List<Object> get props => [job];

  @override
  String toString() => 'job Deleted {job: $job}';
}