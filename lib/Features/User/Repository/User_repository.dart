import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:meta/meta.dart';

import '../User.dart';

class UserRepository {
  final UserDataProvider dataProvider;

  UserRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<User> createUser(User user) async {
    print("This is the creatUser method in repo");
    return await dataProvider.createUser(user);
  }

  Future<List<User>> getUsers() async {
    print("This is the getUser method in repo");
    return await dataProvider.getUsers();
  }

  Future<User> getUser(String email) async {
    print("This is the getUser(email) method in repo");
    return await dataProvider.getUser(email);
  }

  Future<void> updateUser(User user) async {
    print("This is the updateUser method in repo");
    await dataProvider.updateUser(user);
  }

  Future<void> deleteUser(String user) async {
    print("This is the deleteUser method in repo");
    await dataProvider.deleteUser(user);
  }
}
