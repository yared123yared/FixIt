// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_group_project/Features/User/Bloc/bloc.dart';
// import 'package:flutter_group_project/Features/User/Model/User.dart';
// import 'package:flutter_group_project/Features/User/Repository/repository.dart';
// import 'package:flutter_group_project/Features/User/util/util.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class MockItemRepository extends Mock implements UserRepository {}

// void main() {
//   UserBloc userBloc;
//   UserRepository userRepository;

//   setUp(() {
//     userRepository = MockItemRepository();
//     userBloc = UserBloc(userRepository: userRepository,util: Util());
//   });

//   tearDown(() {
//     userBloc?.close();
//   });

//   group(
//     'Item Bloc',
//         () {
//       test('throws AssertionError if WeatherRepository is null', () {
//         expect(
//               () => UserBloc(userRepository: null,util: null),
//           throwsA(isAssertionError),
//         );
//       });

//       group(
//         'ItemRequested',
//             () {
//           final List<User> mockItem = [
//             User(
//                 Email: "asdfasd@gmail.com",
//                 FullName: "asdfasd",
//                 Password: "asdfasd@44",
//                 Phone: "0945684641",
//                 Role: "ADMIN",
//                 Picture: "images/StateBags.jpg"),
//             User(
//                 Email: "jghfghjg@gmail.com",
//                 FullName: "jghfghjg",
//                 Password: "jghfghjg@44",
//                 Phone: "0945684641",
//                 Role: "ADMIN",
//                 Picture: "images/StateBags.jpg"),
//             User(
//                 Email: "nbzxmcbv@gmail.com",
//                 FullName: "nbzxmcbv",
//                 Password: "nbzxmcbv@44",
//                 Phone: "0945684641",
//                 Role: "ADMIN",
//                 Picture: "images/StateBags.jpg"),
//             User(
//                 Email: "qwewqre@gmail.com",
//                 FullName: "qwewqre",
//                 Password: "qwewqre@44",
//                 Phone: "0986413545",
//                 Role: "ADMIN",
//                 Picture: "images/StateBags.jpg"),
//           ];
//           blocTest(
//               'emits [ItemLoad, ItemLoadSuccess] when WeatherRequested is added and getWeather succeeds',
//               build: () {
//                 when(userRepository.getUsers()).thenAnswer(
//                       (_) => Future.value(
//                     mockItem,
//                   ),
//                 );
//                 return userBloc;
//               },
//               act: (bloc) => bloc.add(UsersLoad()),
//               expect: [UserLoading(), UsersLoadSuccess(mockItem)]);

//           blocTest(
//             'emits [ItemLoad, ItemError] when FetchQuote is added and fetchQuote fails',
//             build: () {
//               when(userRepository.getUsers())
//                   .thenThrow(Exception('error getting items'));
//               return userBloc;
//             },
//             act: (bloc) => bloc.add(UsersLoad()),
//             expect: [UserLoading(), UserOperationFailure()],
//           );
//         },
//       );
//     },
//   );

//   group(
//     'Item Bloc',
//         () {
//       test('throws AssertionError if WeatherRepository is null', () {
//         expect(
//               () => UserBloc(userRepository: null, util: Util()),
//           throwsA(isAssertionError),
//         );
//       });

//       group(
//         'ItemRequested',
//             () {
//           final User mockItem = User(
//               Email: "qwewqre@gmail.com",
//               FullName: "qwewqre",
//               Password: "qwewqre@44",
//               Phone: "0986413545",
//               Role: "ADMIN",
//               Picture: "images/StateBags.jpg");

//           final List<User> mockGetItem = [
//             User(
//                 Email: "qwewqre@gmail.com",
//                 FullName: "qwewqre",
//                 Password: "qwewqre@44",
//                 Phone: "0986413545",
//                 Role: "ADMIN",
//                 Picture: "images/StateBags.jpg"),
//             User(
//                 Email: "qwewqre@gmail.com",
//                 FullName: "qwewqre",
//                 Password: "qwewqre@44",
//                 Phone: "0986413545",
//                 Role: "ADMIN",
//                 Picture: "images/StateBags.jpg"),

//             User(
//               Email: "qwewqre@gmail.com",
//               FullName: "qwewqre",
//               Password: "qwewqre@44",
//               Phone: "0986413545",
//               Role: "ADMIN",
//               Picture: "images/StateBags.jpg"),
//           ];

//           blocTest(
//               'emits [ ItemLoadSuccess] when WeatherRequested is added and getWeather succeeds',
//               build: () {
//                 when(userRepository.createUser(mockItem)).thenAnswer(
//                       (_) => Future.value(
//                     mockItem,
//                   ),
//                 );
//                 return userBloc;
//               },

//               act: (bloc) => bloc.add(UsersLoad()),
//               expect: [UsersLoadSuccess(mockGetItem)]);

//           blocTest(
//             'emits [ItemLoad, ItemError] when FetchQuote is added and fetchQuote fails',
//             build: () {
//               when(userRepository.createUser(mockItem))
//                   .thenThrow(Exception('error getting items'));
//               return userBloc;
//             },
//             act: (bloc) => bloc.add(UsersLoad()),
//             expect: [UserOperationFailure()],
//           );
//         },
//       );
//     },
//   );
// }