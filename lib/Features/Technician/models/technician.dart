

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_group_project/Features/User/User.dart';

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
     this.experiance,
     this.completedWork,
     this.department,
     this.user
});

  List<Object> get props =>[userId,experiance,completedWork,department,user];

  factory Technician.fromJson(Map<String,dynamic> json){
    User user;
    final userRaw = json['user'];
    print("Tech user is $userRaw");
    user = User(
      UserId: userRaw['userId'],
      FullName: userRaw['fullName'] ,
      Email: userRaw['email'] ,
      Password: userRaw['password'],
      Phone: userRaw['phone'] ,
      Picture: userRaw['picture'] ,
      RoleId: userRaw['roleId'] ,
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