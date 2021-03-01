import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter_group_project/Features/Authentication/authntication.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../ip_address.dart';

class AuthDataProvider {

  String URL = IpAdress.ipAddress;

  final http.Client httpClient;

  AuthDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Util util = new Util();




  Future<User> login(Authentication auth) async {
    print('logging------------------------here-');

    User user1;
    final urlLogin ="$URL/Users/authenticate";
    try {
      final response = await httpClient.post(
        urlLogin,
        body: json.encode({

          'username': auth.email,

          'password': auth.password,

        }),
      );
      print('code----------${response.statusCode}');
      if (response.statusCode == 422) {
        throw HttpException('Invalid Input');
      } else if (response.statusCode == 404) {
        throw HttpException('Incorrect username or password');
      } else {
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;
        user1 = UserModel.fromJson(extractedData).user;
        String token = UserModel.fromJson(extractedData).token;
        // String expiry = response.headers['expiry_date'].toString();

        await util.storeUserInformation(user1);
        await util.storeTokenAndExpiration(token);
      }
    } catch (e) {
      throw e;
    }
    return user1;
  }


}
