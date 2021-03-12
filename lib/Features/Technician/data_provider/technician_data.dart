import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/Technician/models/models.dart';
import 'package:http/http.dart' as http;

class TechnicianDataProvider{
  final _baseUrl = "http://192.168.137.1:5001/api/technicians";
  final http.Client  httpClient;


  TechnicianDataProvider({@required this.httpClient}) : assert(httpClient != null);


  Future<List<Technician>> getTechnicians() async {
    print("Getint all the technicians");
    final response = await httpClient.get('$_baseUrl');

    if (response.statusCode == 200) {
      final technicians = jsonDecode(response.body) as List;
      print(technicians);
      List<Technician> lists = technicians.map((technician) => Technician.fromJson(technician)).toList();
      print(lists);

      return technicians.map((course) => Technician.fromJson(course)).toList();
    } else {
      throw Exception('Failed to load technician');
    }
  }



}