
import 'package:flutter_group_project/Features/User/Data_provider/User_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_group_project/Features/User/Model/User.dart';


class MockClient extends Mock implements http.Client {}

class MocUserDataProvider extends Mock implements UserDataProvider {}

main() {
  group('user repository test', () {
  final user1 = User(
      Email: 'email1',
      FullName: 'geya',
      Password: '',
      Phone: '',
    Role: '',
    Picture: '');
 final user2 = User(
      Email: 'email2',
      FullName: 'geya',
  
      Password: '',
      Phone: '',
    Role: '',
    Picture: '');
    UserDataProvider userDataProvider = MocUserDataProvider();
    List<User> users = [];
    test('Get all users', () async {
      when(userDataProvider.getUsers()).thenAnswer((_) async {
        return users;
      });
      expect(users.length, 0);
    });

    test('create user', () async {
      when(userDataProvider.createUser(user1)).thenAnswer((_) async {
        users.add(user1);
        return Future.value(user1);
      });
      expect(users.length, 0);
    });

    test('delete user', () async {
      when(userDataProvider.deleteUser(user1.Email))
          .thenAnswer((_) async {
        users.remove(user1);
        return Future.value(user1);
      });

      expect(users.length, 0);
    });
    test('update user', () async {
      when(userDataProvider.deleteUser(user1.Email))
          .thenAnswer((_) async {
        users.add(user2);
      });
      expect(users.length, 0);
    });
  });
}
