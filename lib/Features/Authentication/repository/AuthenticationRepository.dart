import 'package:flutter_group_project/Features/Authentication/authntication.dart';
import 'package:flutter_group_project/Features/Authentication/data_provider/Auth_Data.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:meta/meta.dart';


class AuthenticationRepository {
  final AuthDataProvider authDataProvider;

  AuthenticationRepository({@required this.authDataProvider})
      : assert(authDataProvider != null);

  Future<User> login(Authentication user) async {
    return await authDataProvider.login(user);
  }


}
