import 'package:flutter_group_project/Features/User/Data_provider/User_data.dart';
import 'package:flutter_group_project/Features/User/Repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';


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
//  final user2 = User(
//       Email: 'email2',
//       FullName: 'geya',

//       Password: '',
//       Phone: '',
//     Role: '',
//     Picture: '');
    UserDataProvider userDataProvider = MocUserDataProvider();
    UserRepository userRepository =
        UserRepository(dataProvider: userDataProvider);
//     List<User> users = [];
    test('get all users', () async {
      when(userRepository.getUsers()).thenAnswer((_) async {
        return Future.value();
      });

      userRepository.getUsers();

      verify(userRepository.getUsers()).called(1);
    });

    test('create user', () async {
      when(userRepository.createUser(user1)).thenAnswer((_) async {
        return Future.value();
      });

      userRepository.createUser(user1);

      verify(userRepository.createUser(user1)).called(1);
    });

    test('delete user', () async {
      when(userRepository.deleteUser(user1.UserId)).thenAnswer((_) async {
        return Future.value();
      });

      userRepository.deleteUser(user1.UserId);

      verify(userRepository.deleteUser(user1.UserId)).called(1);
    });
   

    test('update user', () async {
      when(userRepository.updateUser(user1)).thenAnswer((_) async {
        return Future.value();
      });

      userRepository.updateUser(user1);

      verify(userRepository.updateUser(user1)).called(1);
    });

     test('get user', () async {
      when(userRepository.getUser(user1.Email)).thenAnswer((_) async {
        return Future.value();
      });

      userRepository.getUser(user1.Email);

      verify(userRepository.getUser(user1.Email)).called(1);
    });
  });
}
