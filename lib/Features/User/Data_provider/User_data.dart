import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:flutter_group_project/ip_address.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  final _baseUrl = IpAdress.ipAddress;
  final http.Client httpClient;

  UserDataProvider({@required this.httpClient}) : assert(httpClient != null);
  Util util=  new Util();
  Future<User> createUser(User user) async {//Used on signUp and to add new user in ADMIN interface
    print("This is the create method");
    final response = await httpClient.post(
      '$_baseUrl/api/users/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "FullName": user.FullName,
        "Email": user.Email,
        "Password": user.Password,
        "Phone": user.Phone,
        "Picture":"Assets/assets/fixit.png",
        "roleId": 1,
      }),
    );

    if (response.statusCode == 200) {
      User user = User.fromJson(jsonDecode(response.body));
      String token = response.headers['token'].toString();
      String expiry = response.headers['expiry_date'].toString();

      await util.storeUserInformation(user);
      await util.storeTokenAndExpiration(token);
      return user;
    } else {
      throw Exception('Failed to create User.');
    }
  }

  Future<List<User>> getUsers() async {//For ADMIN to get list of users
    print("This is the getUsers method");
    try {
      String token = await util.getUserToken();
      String expiry = await util.getExpiryTime();
      final response = await httpClient.get('http://192.168.137.1:5001/api/users',
          headers: {HttpHeaders.authorizationHeader: token, 'expiry': expiry});
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
  Future <User> getUser(String email) async {//Used for login => Returns User then done flutter side authentication
    print("This is the getUser(email) method");
    User user;
    try {
      final response = await httpClient.get('http://192.168.137.1:4000/User/$email');
      if (response.statusCode == 200) {
        final extractedData =json.decode(response.body) as Map<String, dynamic>;
        user = User.fromJson(extractedData);
        String token = response.headers['Token'].toString();
        String expiry = response.headers['Expiry_date'].toString();
        await util.storeUserInformation(user);
        await util.storeTokenAndExpiration(token);
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load User');
      }
    } catch (e) {
      print("Exception thrown $e");
    }
  }




  Future<void> deleteUser(int id) async {//To delete the user(either by USER or by the ADMIN)
    print("This is the delete method");
    print("email of service to be deleted : $id");

    final http.Response response = await http.delete(
      '$_baseUrl/api/users/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

      print(response.statusCode);
    if (response.statusCode != 200) {

      throw Exception('Failed to delete user.');
    }
  }

  Future<void> updateUser(User user) async {//Updates user(here also by the USER or by the ADMIN => to assign role)
    String token = await util.getUserToken();
    String expiry = await util.getExpiryTime();
    final http.Response response = await httpClient.post(
      '$_baseUrl/api/users',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // HttpHeaders.authorizationHeader: token, 'expiry': expiry
      },
      body: jsonEncode(<String, dynamic>{
        "userId":user.UserId,
        "fullName": user.FullName,
        "email": user.Email,
        "password": user.Password,
        "phone": user.Phone,
        "roleId": user.RoleId
      }),
    );
    print('provider successful update ;) ${response.statusCode}');

    if (response.statusCode != 200) {
      throw Exception('Failed to update User.');
    }
  }
}
