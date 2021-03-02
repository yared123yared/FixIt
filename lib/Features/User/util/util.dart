import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Util {//User Info management ... Token and Shared Preferences
  Future<void> storeUserInformation(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('FullName', user.FullName);
    await prefs.setInt('RoleId', user.Role.roleId);
    await prefs.setString('Picture', user.Picture);
    await prefs.setString('Email', user.Email);
    await prefs.setString('Password', user.Password);
    await prefs.setString('Phone', user.Phone);
  }

  Future<User> getUserInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User user = new User(
      FullName: prefs.getString("FullName"),
      RoleId: prefs.getInt("RoleId"),
      Picture: prefs.getString("Picture"),
      Email: prefs.getString("Email"),
      Password: prefs.getString("Password"),
      Phone: prefs.getString("Phone"),


    );

    return user;
  }

  Future<void> storeTokenAndExpiration(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

  }

  Future<String> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<String> getExpiryTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  DateTime getDateTimeFromString(String dateString) {
    return DateTime.parse(dateString);
  }

  bool isExpired(String expiry) {
    int timeExpiry = int.parse(expiry);
    var date = new DateTime.fromMicrosecondsSinceEpoch(timeExpiry * 1000);
    if (date.isAfter(DateTime.now())) return false;
    return true;
  }
}
