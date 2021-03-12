import 'package:equatable/equatable.dart';
import 'package:flutter_group_project/Features/Technician/models/models.dart';


abstract class TechnicianEvent extends Equatable{
  const TechnicianEvent();
}

class TechnicianLoad extends TechnicianEvent{
  const TechnicianLoad();

  @override
  List<Object> get props => [];

}
class TechnicianCreate extends TechnicianEvent {
  final Technician technician;

  const TechnicianCreate (this.technician);

  @override
  List<Object> get props => [technician];

  @override
  String toString() => 'technician Created {technician: $technician}';
}
class TechnicianUpdate extends TechnicianEvent {
  final Technician technician;

  const TechnicianUpdate(this.technician);

  @override
  List<Object> get props => [technician];

  @override
  String toString() => 'technician Updated {technician: $technician}';
}
class TechnicianDelete extends TechnicianEvent {
  final Technician technician;

  const TechnicianDelete(this.technician);

  @override
  List<Object> get props => [technician];

  @override
  String toString() => 'technician Deleted {technician: $technician}';
}