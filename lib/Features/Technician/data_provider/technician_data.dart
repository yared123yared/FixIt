import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_group_project/Features/Technician/models/models.dart';
import 'package:flutter_group_project/Features/Technician/repository/repository.dart';
import 'package:flutter_group_project/Features/User/Data_provider/data_provider.dart';
import 'package:flutter_group_project/Features/User/Repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_group_project/Features/User/User.dart' as newUser;

final userUrl = "http://192.168.137.1:5001/api/technicians";
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

  Future<Technician> createTechnician(Technician technician) async {
    UserDataProvider _dataRepo = UserDataProvider(httpClient: httpClient);
    UserRepository _repo = UserRepository(dataProvider: _dataRepo);
    print('at technician user is ${technician.user.toString()}');
    newUser.User user = newUser.User(
      FullName: technician.user.FullName,
      Email: technician.user.Email,
      Password: technician.user.Password,
      Phone: technician.user.Phone,
      Picture: technician.user.Picture,
      RoleId: technician.user.UserId

    );
    print(user.toString());
    await _repo.createUser(technician.user);
    newUser.User userByEmail = await _repo.getUserByEmail(technician.user.Email);
    print("creating technician");
    print('technician: $technician');
    final response = await httpClient.post(
      Uri.http('192.168.137.1:5001','/api/technicians'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "userId": userByEmail.UserId,
        "completedWork": technician.completedWork,
        "department": technician.department,
      }),
    );
    print("response: ${response.body}");
    if (response.statusCode == 200) {
      print('Creating the technicians');
      return Technician(userId: 0);
    } else {
      throw Exception('Failed to create technician.');
    }
  }
}