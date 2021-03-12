import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/Technician/data_provider/technician_data.dart';
import 'package:flutter_group_project/Features/Technician/models/technician.dart';


class TechnicianRepository{
  final TechnicianDataProvider dataProvider;

  TechnicianRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<List<Technician>> getTechnicians() async {
    return await dataProvider.getTechnicians();
  }


}