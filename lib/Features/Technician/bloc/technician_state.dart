import 'package:equatable/equatable.dart';
import 'package:flutter_group_project/Features/Technician/models/models.dart';
class TechnicianState extends Equatable{
  const TechnicianState();
  @override
  List<Object> get props => [];


}

class TechnicianLoading extends TechnicianState{}

class TechnicianLoadingSuccess extends TechnicianState{
  final List<Technician> jobs;

  TechnicianLoadingSuccess([this.jobs = const []]);

  @override
  List<Object> get props => [jobs];
}
class TechnicianOperationFailure extends TechnicianState {

}
