import 'package:equatable/equatable.dart';
import '../Service.dart';


abstract class ServiceEvent extends Equatable {
  const ServiceEvent();
}

class ServiceLoad extends ServiceEvent {
  const ServiceLoad();

  @override
  List<Object> get props => [];
}

class ServiceCreate extends ServiceEvent {
  final Service service;

  const ServiceCreate(this.service);

  @override
  List<Object> get props => [service];

  @override
  String toString() => 'Features.Service Created {service: $service}';
}

class ServiceUpdate extends ServiceEvent {
  final Service service;

  const ServiceUpdate(this.service);

  @override
  List<Object> get props => [service];

  @override
  String toString() => 'Features.Service Updated {service: $service}';
}

class ServiceDelete extends ServiceEvent {
  final Service service;

  const ServiceDelete(this.service);

  @override
  List<Object> get props => [service];

  @override
  toString() => 'Features.Service Deleted {service: $service}';
}
