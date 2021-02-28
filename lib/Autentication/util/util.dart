import 'package:flutter_group_project/Autentication/Model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Util {//User Info management ... Token and Shared Preferences
  Future<void> storeUserInformation(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fName', user.fName);
    await prefs.setString('role', user.role);
    await prefs.setString('imageUrl', user.imageUrl);
    await prefs.setString('email', user.email);
    await prefs.setString('password', user.password);
    await prefs.setString('phone', user.phone);
  }

  Future<User> getUserInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User user = new User(
      fName: prefs.getString("fName"),
      role: prefs.getString("role"),
      imageUrl: prefs.getString("imageUrl"),
      email: prefs.getString("email"),
      password: prefs.getString("password"),
      phone: prefs.getString("phone"),

    );

    return user;
  }

  Future<void> storeTokenAndExpiration(String expiry, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('expiry', expiry);
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
