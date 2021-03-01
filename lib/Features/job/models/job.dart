
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Job extends Equatable{
    final int jobId;
    final String jobName;
    final String description;
    final int userId;
    final String location;
    final int technicianId;
    final String acceptanceStatus;
    final String doneStatus;
    final User user;
    final Technician technician;

    Job({
      this.jobId,
      this.jobName,
      this.description,
      this.userId,
      this.location,
      this.technicianId,
      this.acceptanceStatus,
      this.doneStatus,
      this.user,
      this.technician
    });

    List<Object> get props => [jobName,description,userId,location,technicianId,acceptanceStatus,doneStatus,user];

    factory Job.fromJson(Map<String, dynamic> json){
      final user = User(
        userId: json['user']['userId'],
        fullName: json['user']['fullName'] ,
        email: json['user']['email'] ,
        password: json['user']['password'],
        phone: json['user']['phone'] ,
        address: json['user']['address'] ,
        picture: json['user']['picture'] ,
        sex: json['user']['sex'] ,
        dob: json['user']['dob'] ,
        role: json['user']['role'] ,

      );
      final technicianRaw = json['technician'];
      final techUserRaw = technicianRaw['user'];
      final techUser =  User(
        userId: techUserRaw['userId'],
        fullName: techUserRaw['fullName'] ,
        email: techUserRaw['email'] ,
        password: techUserRaw['password'],
        phone: techUserRaw['phone'] ,
        address: techUserRaw['address'] ,
        picture: techUserRaw['picture'] ,
        sex: techUserRaw['sex'] ,
        dob: techUserRaw['dob'] ,
        role: techUserRaw['role'] ,

      );
      final technicain = Technician(
          technicianId: technicianRaw['technicianId'],
          userId: technicianRaw['userId'],
          experiance: technicianRaw['experiance'],
          completedWork: technicianRaw['complete'],
          department: technicianRaw['department'],
          user: techUser);
      return Job(
        jobId: json["jobId"],
        jobName: json["jobName"],
        description: json["description"],
        userId: json["userId"],
        location: json["location"],
        technicianId: json["technicianId"],
        acceptanceStatus: json["accepteStatus"],
        doneStatus: json["doneStatus"],
          user:user,
          technician: technicain
      );
     }

    @override
    String toString() => 'Job {jobName: $jobName, '
        'description: $description,'
    'userId: $userId,'
    'location:$location,'
    'technicianId: $technicianId,'
    'acceptanceStatus: $acceptanceStatus,'
    'doneStatus: $doneStatus'
    'user: $user,'
    'technician: $technician'
        '}';
}

@immutable
class User extends Equatable{
  final int userId;
  final String fullName;
  final String email;
  final String password;
  final String phone;
  final String address;
  final String picture;
  final String sex;
  final String dob;
  final String role;

  User({this.userId,
    @required this.fullName,
    @required this.email,
    @required this.password,
    @required this.phone,
    @required this.address,
    @required this.picture,
    @required this.sex,
    @required this.dob,
    @required this.role
  });

  @override
  // TODO: implement props
  List<Object> get props => [fullName,email,password,phone,address,picture,sex,dob,role];


}

@immutable
class Technician extends Equatable{

  final int technicianId;
  final int userId;
  final String experiance;
  final int completedWork;
  final String department;
  final User user;

  Technician({this.technicianId,

    @required this.userId,
    @required this.experiance,
    @required this.completedWork,
    @required this.department,
    @required this.user,

  });

  @override
  // TODO: implement props
  List<Object> get props => [userId,experiance,completedWork,department,user,];


}