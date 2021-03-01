// // // // import 'package:bloc_test/bloc_test.dart';
// // // // import 'package:flutter_group_project/Autentication/Bloc/bloc.dart';
// // // // import 'package:flutter_group_project/Autentication/Data_provider/User_data.dart';
// // // // import 'package:flutter_group_project/Autentication/Model/User.dart';
// // // // import 'package:flutter_group_project/Autentication/Repository/repository.dart';
// // // // import 'package:flutter_group_project/Autentication/util/util.dart';
// // // // import 'package:flutter_test/flutter_test.dart';
// // // // import 'package:mockito/mockito.dart';
// // // // //
// // // // // class MockUserRepository extends Mock implements UserRepository{
// // // //   @override
// // // //   Future<User> createUser(User user) {
// // // //     // TODO: implement createUser
// // // //     throw UnimplementedError();
// // // //   }
// // // //
// // // //   @override
// // // //   // TODO: implement dataProvider
// // // //   UserDataProvider get dataProvider => throw UnimplementedError();
// // // //
// // // //   @override
// // // //   Future<void> deleteUser(String user) {
// // // //     // TODO: implement deleteUser
// // // //     throw UnimplementedError();
// // // //   }
// // // //
// // // //   @override
// // // //   Future<User> getUser(String email) {
// // // //     // TODO: implement getUser
// // // //     throw UnimplementedError();
// // // //   }
// // // //
// // // //   @override
// // // //   Future<List<User>> getUsers() {
// // // //     // TODO: implement getUsers
// // // //     throw UnimplementedError();
// // // //   }
// // // //
// // // //   @override
// // // //   Future<void> updateUser(User user) {
// // // //     // TODO: implement updateUser
// // // //     throw UnimplementedError();
// // // //   }
// // // // }
// // // //
// // // // void main(){
// // // //   MockUserRepository mockUserRepository;
// // // //   setUp((){
// // // //     mockUserRepository = MockUserRepository();
// // // //   });
// // // //
// // // //   // group(
// // // //   //   "getUser",
// // // //   //     (){final user = User(email: "NameFather@mgmail.com",fName: "NameFather",phone: "0911223344",password: "MYPASS",role: "ADMIN" ,imageUrl: "Assets/assets/fixit.png");
// // // //
// // // //   group('GetWeather', () {
// // // //     final user = User(email: "NameFather@mgmail.com",fName: "NameFather",phone: "0911223344",password: "MYPASS",role: "ADMIN" ,imageUrl: "Assets/assets/fixit.png");
// // // //
// // // //     // Old way of testing Blocs - like regular Streams
// // // //     test(
// // // //       'NEWER WAY BUT LONG-WINDED emits [WeatherLoading, WeatherLoaded] when successful',
// // // //           () {
// // // //         when(mockUserRepository.getUser("NameFather@mgmail.com"))
// // // //             .thenAnswer((_) async => user);
// // // //         final bloc = UserBloc(userRepository: mockUserRepository, util: Util());
// // // //         bloc.add(UserLoad("NameFather@mgmail.com"));
// // // //
// // // //         emitsExactly(bloc, [
// // // //           UserLoading(),
// // // //           UserLoadSuccess(user),
// // // //         ]);
// // // //       },
// // // //     );
// // // //     // test(
// // // //     //   'OLD WAY emits [WeatherLoading, WeatherLoaded] when successful',
// // // //     //       () {
// // // //     //     when(mockUserRepository.getUser(user.email))
// // // //     //         .thenAnswer((_) async => user);
// // // //     //     final bloc = UserBloc(userRepository: mockUserRepository, util:  Util());
// // // //     //     bloc.add(UserLoad(user.email));
// // // //     //     expectLater(
// // // //     //       bloc,
// // // //     //       emitsInOrder([
// // // //     //         UserLoading(),
// // // //     //         UserLoadSuccess(user),
// // // //     //       ]),
// // // //     //     );
// // // //     //   },
// // // //     // );
// // // //   });
// // // // }
// // // // // void main() {
// // // // //   group('WeatherBloc', () {
// // // // //     test('throws AssertionError if WeatherRepository is null', () {
// // // // //       expect(
// // // // //             () => WeatherBloc(weatherRepository: null),
// // // // //         throwsA(isAssertionError),
// // // // //       );
// // // // //     });
// // // // //   });
// // // // // }
// // //
// // // import 'package:bloc_test/bloc_test.dart';
// // // import 'package:flutter_group_project/Autentication/Bloc/bloc.dart';
// // // import 'package:flutter_test/flutter_test.dart';
// // //
// // // class MockWeatherBloc extends UserBloc {}
// // //
// // // void main() {
// // //   //MockWeatherBloc mockWeatherBloc;
// // //
// // //   // setUp(() {
// // //   //   mockWeatherBloc = MockWeatherBloc();
// // //   // });
// // //   test('Example mocked BLoC test', () {
// // //     true;});
// // // }
// // import 'dart:convert';
// //
// // import 'package:flutter_group_project/Autentication/Data_provider/data_provider.dart';
// // import 'package:flutter_group_project/Autentication/Model/models.dart';
// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:mockito/mockito.dart';
// // import 'package:http/http.dart' as http;
// //
// // class MockUserDataProvider extends Mock implements UserDataProvider {
// //   UserDataProvider _real;
// //
// //   MockUserDataProvider(http.Client httpClient) {
// //     _real = UserDataProvider(httpClient: httpClient);
// //     when(getUsers()).thenAnswer((_) => _real.getUsers());
// //   }
// // }
// //
// // class MockHttpClient extends Mock implements http.Client {}
// //
// // void main() {
// //   group('assertion', () {
// //     test('should assert if null', () {
// //       expect(
// //             () => UserDataProvider(httpClient: null),
// //         throwsA(isAssertionError),
// //       );
// //     });
// //   });
// //
// //   group('get data', () {
// //     final mockHttpClient = MockHttpClient();
// //     final mockUserDataProvider = MockUserDataProvider(mockHttpClient);
// //     test('return Item if http call successfully', () async {
// //       // given
// //       final mockQuoteString ='{"Email": "abcdefg@gmail.com", "FullName": "abcdefg", "Phone": "0911111111","Password": "myPAssPass","Role": "User","Picture": "images/StateBags.jpg"}';
// //          // '[{"Email": "abcdefg@gmail.com", "FullName": "abcdefg", "Phone": "0911111111","Password": "myPAssPass","Role": "User","Picture": "images/StateBags.jpg"},{"Email": "abcdefg22@gmail.com", "FullName": "abcdefg22", "Phone": "0911111122","Password": "myPAssPass22","Role": "User22","Picture": "images/StateBags22.jpg"}]';
// //       //
// //       // email: json['Email'],
// //       // fName: json['FullName'],
// //       // phone: json['Phone'],
// //       // password: json['Password'],
// //       // role: json['Role'],
// //       // imageUrl: json['Picture']
// //       final mockItem = jsonDecode(mockQuoteString) as List;
// //       print(mockItem);
// //       final mockItems = mockItem.map((e) => User.fromJson(e));//.toList();
// //
// //       when(final response = await http.get('http://192.168.137.1:4000/User/${"abcdefg@gmail.com"}'))
// //           .thenAnswer(
// //               (_) async => Future.value(http.Response(mockQuoteString, 200)));
// //
// //       expect(await mockUserDataProvider.getUser("abcdefg@gmail.com"), mockItems);
// //     });
// //
// //     test('return Exception if http call error', () async {
// //       when(mockHttpClient.get('http://10.0.2.2:8181/api/items?limit=5&page=1'))
// //           .thenAnswer((_) async =>
// //           Future.value(http.Response('error getting quotes', 202)));
// //
// //       expect(
// //               () async => await mockUserDataProvider.getUser("abcdefg@gmail.com"), throwsA(isException));
// //     });
// //   });
// // }
// import 'dart:convert';
//
// import 'package:flutter_group_project/Autentication/Data_provider/data_provider.dart';
// import 'package:flutter_group_project/Autentication/Model/User.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:http/http.dart' as http;
//
// class MockItemApiClient extends Mock implements UserDataProvider {
//   UserDataProvider _real;
//
//   MockItemApiClient(http.Client httpClient) {
//     _real = UserDataProvider(httpClient: httpClient);
//     when(getUser("email")).thenAnswer((_) => _real.getUser("email"));
//   }
// }
//
// class MockHttpClient extends Mock implements http.Client {}
//
// void main() {
//   group('assertion', () {
//     test('should assert if null', () {
//       expect(
//             () => UserDataProvider(httpClient: null),
//         throwsA(isAssertionError),
//       );
//     });
//   });
//
//   group('get data', () {
//     final mockHttpClient = MockHttpClient();
//     final mockItemApiClient = MockItemApiClient(mockHttpClient);
//     test('return Item if http call successfully', () async {
//       // given
//       final mockQuoteString ='[{"Email": "abcdefg@gmail.com", "FullName": "abcdefg", "Phone": "0911111111","Password": "myPAssPass","Role": "User","Picture": "images/StateBags.jpg"}]';
//           //'[{"id": "123", "name": "abc", "price": "15","description": "xdskjlckjdb cbbds","imagePath": "images/StateBags.jpg"},{"id": "124", "name": "abc", "price": "16","description": "xdskjlckjdb cbbds","imagePath": "images/StateBags.jpg"}]';
//
//       final mockItem = jsonDecode(mockQuoteString) as List;
//       print(mockItem);
//       final mockItems = mockItem.map((e) => User.fromJson(e)).toList();
//       print("mockItem");
//       print(mockItem);
//       print("mockItems");
//       print(mockItems);
//       print(mockItems == mockItem);
//       when(mockHttpClient.get('http://10.0.2.2:8181/api/items?limit=5&page=1'))
//           .thenAnswer(
//               (_) async => Future.value(http.Response(mockQuoteString, 200)));
//       print("");
//       print("");
//       print("");
//       print("");
//       print("");
//       print(""); print("");
//       print("");
//
// print(await mockItemApiClient.getUser('http://192.168.137.1:4000/User/"abcdefg@gmail.com'));
//     print("");
//       print("");
//       print(""); print("");
//       print("");
//       expect(await mockItemApiClient.getUser("abcdefg@gmail.com"), mockItems);
//     });
//
//     test('return Exception if http call error', () async {
//       when(mockHttpClient.get('http://10.0.2.2:8181/api/items?limit=5&page=1'))
//           .thenAnswer((_) async =>
//           Future.value(http.Response('error getting quotes', 202)));
//
//       expect(
//               () async => await mockItemApiClient.getUser("abcdefg@gmail.com"), throwsA(isException));
//     });
//   });
// }

import 'package:flutter_group_project/Autentication/Data_provider/data_provider.dart';
import 'package:flutter_group_project/Autentication/Repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
class MockItemApiClient extends Mock implements UserDataProvider {}

void main() {
  group('assertion', () {
    test('should assert if null', () {
      expect(
            () => UserRepository(dataProvider: null),
        throwsA(isAssertionError),
      );
    });
  });
  group('fetchQuote', () {
    final mockQuoteRepository =
    UserRepository(dataProvider: MockItemApiClient());
    test('should called fetchQuote from QuoteApiClient', () async {
      when(mockQuoteRepository.getUsers()).thenAnswer((_) async {
        return Future.value();
      });

      mockQuoteRepository.getUsers();

      verify(mockQuoteRepository.getUsers()).called(1);
    });
  });
}