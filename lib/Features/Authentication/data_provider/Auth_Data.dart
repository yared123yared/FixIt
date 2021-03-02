import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter_group_project/Features/Authentication/authntication.dart';
import 'package:flutter_group_project/Features/User/Model/UMod.dart';
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

    User userToReturn;
    UserModel um;
    UMod user1;
    final urlLogin ="$URL/api/users/authenticate";
    try {
      print("++++++++Try Method");
      print("Username : ${auth.email}");
      final response = await httpClient.post(
        urlLogin,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{

          'username': auth.email,

          'password': auth.password,

        }),
      );
      print('code----------${response.statusCode}');
      if (response.statusCode == 422) {
        throw HttpException('Invalid Input');
      } else if (response.statusCode == 400) {
        throw HttpException('Incorrect username or password');
      } else {
        print("++++++ELSE+++++");
        final extractedData = json.decode(response.body) as Map<String, dynamic>;
        print("...........Extracted..........");
        um = UserModel.fromJson(extractedData);
        print("...........UMod created..........");
        print("PARSED USER  +++++++++=========+++++ ${um.user.Role.roleName}");
        String token = um.token;
        userToReturn= um.user;
        print(userToReturn.Role);
        // String expiry = response.headers['expiry_date'].toString();


        //userToReturn = new User(Email: user1.email, FullName: user1.fullName, Phone: user1.phone, Password: user1.password, Role: user1.role, Picture: user1.picture);
        await util.storeUserInformation(userToReturn);
        await util.storeTokenAndExpiration(token);
        print(token);
        print(userToReturn.toString());
        print("...........Done..........");

      }
    } catch (e) {
      print("++++++++CATCH++++");
      print("Exception $e");
      throw e;
    }

    return userToReturn;
  }


}
