import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Technician/repository/repository.dart';

import 'technician_event.dart';
import 'technician_state.dart';

class TechnicianBloc extends Bloc<TechnicianEvent, TechnicianState>{
  final TechnicianRepository technicianRepository;

  TechnicianBloc({@required this.technicianRepository})
      : assert(technicianRepository != null),
        super(TechnicianLoading());
  @override
  Stream<TechnicianState> mapEventToState(TechnicianEvent event) async* {
    if (event is TechnicianLoad) {
      yield TechnicianLoading();
      try {
        final technician = await technicianRepository.getTechnicians();
        yield TechnicianLoadingSuccess(technician);
      } catch (err) {
        print("Technician loading err: $err");
        yield TechnicianOperationFailure();
      }
    }

  }


}