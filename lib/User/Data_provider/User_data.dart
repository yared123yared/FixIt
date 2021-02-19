import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_group_project/Service/Model/Service.dart';
import 'package:flutter_group_project/User/Model/models.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  final _baseUrl = 'http://192.168.137.1:4000';
  final http.Client httpClient;

  UserDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<User> createUser(User user) async {
    print("This is the create method");
    final response = await httpClient.post(
      Uri.http('192.168.137.1:4000', '/User'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "serviceName": user.email,
        "description": user.fName,
        "category": user.lName,
        "initialPrice": user.password,
        "intermediatePrice": user.role
      }),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create User.');
    }
  }

  Future<List<User>> getUsers() async {
    print("This is the getUsers method");
    try {
      final response = await http.get('http://192.168.137.1:4000/User');
      if (response.statusCode == 200) {
        final user = jsonDecode(response.body) as List;
        return user.map((user) => User.fromJson(user)).toList();
      } else {
        throw Exception('Failed to load Users');
      }
    } catch (e) {
      print("Exception thrown $e");
    }
  }
  Future <User> getUser(String email) async {
    print("This is the getUser(email) method");
    try {
      final response = await http.get('http://192.168.137.1:4000/User/$email');
      if (response.statusCode == 200) {
        final user = jsonDecode(response.body) as List;
        return user.map((user) => User.fromJson(user)).toList().first;
      } else {
        throw Exception('Failed to load User');
      }
    } catch (e) {
      print("Exception thrown $e");
    }
  }




  Future<void> deleteUser(String email) async {
    print("This is the delete method");
    print("email of service to be deleted $email");

    final http.Response response = await http.delete(
      'http://192.168.137.1:4000/User/$email',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete course.');
    }
  }

  Future<void> updateUser(User user) async {
    final http.Response response = await httpClient.put(
      'http://192.168.137.1:4000/User/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "serviceName": user.email,
        "description": user.fName,
        "category": user.lName,
        "initialPrice": user.password,
        "intermediatePrice": user.role
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update User.');
    }
  }
}
