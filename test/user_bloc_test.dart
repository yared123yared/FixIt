import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_group_project/Features/User/Bloc/User_bloc.dart';
import 'package:flutter_group_project/Features/User/Bloc/User_event.dart';
import 'package:flutter_group_project/Features/User/Bloc/User_state.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Features/User/Repository/User_repository.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  Util util = Util();
  UserRepository userRepository = MockUserRepository();
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

  final users = [user1, user2];

  blocTest(
    'getUsers [UserLoading, UserLodingSuccess] when successful',
    build: () {
      when(userRepository.getUsers()).thenAnswer((_) async => users);
      return UserBloc(userRepository: userRepository, util: util);
    },
    act: (bloc) => bloc.add(UsersLoad()),
    expect: [UserLoading(), UsersLoadSuccess(users)],
  );

  // blocTest(
  //   'createUser [UserLoading, UserLodingSuccess] when successful',
  //   build: () {
  //     when(userRepository.createUser(user1)).thenAnswer((_) async => user1);
  //     return UserBloc(userRepository: userRepository,util: util);
  //   },
  //   act: (bloc) => bloc.add(UsersLoad()),
  //   expect: [UserLoading(), UsersLoadSuccess(users)],
  // );

  // blocTest(
  //   'deleteUser [UserLoading, UserLodingSuccess] when successful',
  //   build: () {
  //     when(userRepository.deleteUser(user2.email)).thenAnswer((_) async => {});
  //     return UserBloc(userRepository: userRepository,util: util);
  //   },
  //   act: (bloc) => bloc.add(UserLoad(user2.email)),
  //   expect: [UserLoading(), UserLoadSuccess(user1)],
  // );
  // blocTest(
  //   'updateUser [UserLoading, UserLodingSuccess] when successful',
  //   build: () {
  //     when(userRepository.updateUser(user1)).thenAnswer((_) async => {});
  //     return UserBloc(userRepository: userRepository,util: util);
  //   },
  //   act: (bloc) => bloc.add(UserLoad(user2.email)),
  //   expect: [UserLoading(), UserLoadSuccess(user1)],
  // );
}
