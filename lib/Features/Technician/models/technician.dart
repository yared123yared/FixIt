

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_group_project/Features/Job/models/models.dart';

class Technician extends Equatable{
  final int technicianId;
  final int userId;
  final String experiance;
  final int completedWork;
  final String department;
  final User user;

  Technician({
    this.technicianId,
    @required this.userId,
    @required this.experiance,
    @required this.completedWork,
    @required this.department,
    @required this.user
});

  List<Object> get props =>[userId,experiance,completedWork,department,user];

  factory Technician.fromJson(Map<String,dynamic> json){
    User user;
    final userRaw = json['user'];
    user = User(
      userId: userRaw['userId'],
      fullName: userRaw['fullName'] ,
      email: userRaw['email'] ,
      password: userRaw['password'],
      phone: userRaw['phone'] ,
      address: userRaw['address'] ,
      picture: userRaw['picture'] ,
      sex: userRaw['sex'] ,
      dob: userRaw['dob'] ,
      role: userRaw['role'] ,

      // ignore: unnecessary_statements
    );
    return Technician(
      technicianId: json['technicianId'],
      userId: json['userId'],
      experiance: json['experiance'],
      completedWork: json['completedWork'],
      department: json['department'],
      user: user
    );
  }

  @override
  String toString() => 'Technician{technicianId: ${this.technicianId}'
      'userId: ${this.userId}'
      'experiance: ${this.experiance}'
      'completedWork: ${this.completedWork}'
      'department: ${this.department}'
      'user: ${this.user}';


}