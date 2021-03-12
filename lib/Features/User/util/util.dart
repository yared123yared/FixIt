import 'package:flutter_group_project/Features/Role/models/role.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Util {//User Info management ... Token and Shared Preferences
  Future<void> storeUserInformation(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('FullName', user.FullName);
    await prefs.setInt('RoleId', user.RoleId);
    await prefs.setString('Picture', user.Picture);
    await prefs.setString('Email', user.Email);
    await prefs.setString('Password', user.Password);
    await prefs.setString('Phone', user.Phone);
    await prefs.setString('RoleName', user.Role.roleName);
  }

  Future<User> getUserInformation() async {
    print("Entered to the getUserInformation Method");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    User user = new User(
      FullName: prefs.getString("FullName"),
      RoleId: prefs.getInt("Role"),
      Picture: prefs.getString("Picture"),
      Email: prefs.getString("Email"),
      Password: prefs.getString("Password"),
      Phone: prefs.getString("Phone"),
      Role: Rolee(roleId: prefs.getInt("RoleId"),roleName:prefs.getString("RoleName"))

    );
print("this is the user going to return $user");
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
  Future<void> removeToken() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.remove('token');
  }
  Future<void> removeUser() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
   prefs.clear();

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
