import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_group_project/Features/User/Bloc/bloc.dart';
import 'package:flutter_group_project/Features/User/Data_provider/data_provider.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Features/User/Repository/repository.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
//
class MockUserRepository extends Mock implements UserRepository{
  @override
  Future<User> createUser(User user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  // TODO: implement dataProvider
  UserDataProvider get dataProvider => throw UnimplementedError();

  @override
  Future<void> deleteUser(String user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<User> getUser(String email) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}

void main(){
  MockUserRepository mockUserRepository;
  setUp((){
    mockUserRepository = MockUserRepository();
  });

  // group(
  //   "getUser",
  //     (){final user = User(email: "NameFather@mgmail.com",fName: "NameFather",phone: "0911223344",password: "MYPASS",role: "ADMIN" ,imageUrl: "Assets/assets/fixit.png");

  group('GetWeather', () {
    final user = User(email: "NameFather@mgmail.com",fName: "NameFather",phone: "0911223344",password: "MYPASS",role: "ADMIN" ,imageUrl: "Assets/assets/fixit.png");

    // Old way of testing Blocs - like regular Streams
    test(
      'NEWER WAY BUT LONG-WINDED emits [WeatherLoading, WeatherLoaded] when successful',
          () {
        when(mockUserRepository.getUser("NameFather@mgmail.com"))
            .thenAnswer((_) async => user);
        final bloc = UserBloc(userRepository: mockUserRepository, util: Util());
        bloc.add(UserLoad("NameFather@mgmail.com"));

        emitsExactly(bloc, [
          UserLoading(),
          UserLoadSuccess(user),
        ]);
      },
    );
    // test(
    //   'OLD WAY emits [WeatherLoading, WeatherLoaded] when successful',
    //       () {
    //     when(mockUserRepository.getUser(user.email))
    //         .thenAnswer((_) async => user);
    //     final bloc = UserBloc(userRepository: mockUserRepository, util:  Util());
    //     bloc.add(UserLoad(user.email));
    //     expectLater(
    //       bloc,
    //       emitsInOrder([
    //         UserLoading(),
    //         UserLoadSuccess(user),
    //       ]),
    //     );
    //   },
    // );
  });
}
// void main() {
//   group('WeatherBloc', () {
//     test('throws AssertionError if WeatherRepository is null', () {
//       expect(
//             () => WeatherBloc(weatherRepository: null),
//         throwsA(isAssertionError),
//       );
//     });
//   });
// }