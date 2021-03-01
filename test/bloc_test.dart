import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_group_project/Autentication/Bloc/bloc.dart';
import 'package:flutter_group_project/Autentication/Model/User.dart';
import 'package:flutter_group_project/Autentication/Repository/repository.dart';
import 'package:flutter_group_project/Autentication/util/util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockItemRepository extends Mock implements UserRepository {}

void main() {
  UserBloc userBloc;
  UserRepository userRepository;

  setUp(() {
    userRepository = MockItemRepository();
    userBloc = UserBloc(userRepository: userRepository,util: Util());
  });

  tearDown(() {
    userBloc?.close();
  });

  group(
    'Item Bloc',
        () {
      test('throws AssertionError if WeatherRepository is null', () {
        expect(
              () => UserBloc(userRepository: null,util: null),
          throwsA(isAssertionError),
        );
      });

      group(
        'ItemRequested',
            () {
          final List<User> mockItem = [
            User(
                email: "asdfasd@gmail.com",
                fName: "asdfasd",
                password: "asdfasd@44",
                phone: "0945684641",
                role: "ADMIN",
                imageUrl: "images/StateBags.jpg"),
            User(
                email: "jghfghjg@gmail.com",
                fName: "jghfghjg",
                password: "jghfghjg@44",
                phone: "0945684641",
                role: "ADMIN",
                imageUrl: "images/StateBags.jpg"),
            User(
                email: "nbzxmcbv@gmail.com",
                fName: "nbzxmcbv",
                password: "nbzxmcbv@44",
                phone: "0945684641",
                role: "ADMIN",
                imageUrl: "images/StateBags.jpg"),
            User(
                email: "qwewqre@gmail.com",
                fName: "qwewqre",
                password: "qwewqre@44",
                phone: "0986413545",
                role: "ADMIN",
                imageUrl: "images/StateBags.jpg"),
          ];
          blocTest(
              'emits [ItemLoad, ItemLoadSuccess] when WeatherRequested is added and getWeather succeeds',
              build: () {
                when(userRepository.getUsers()).thenAnswer(
                      (_) => Future.value(
                    mockItem,
                  ),
                );
                return userBloc;
              },
              act: (bloc) => bloc.add(UsersLoad()),
              expect: [UserLoading(), UsersLoadSuccess(mockItem)]);

          blocTest(
            'emits [ItemLoad, ItemError] when FetchQuote is added and fetchQuote fails',
            build: () {
              when(userRepository.getUsers())
                  .thenThrow(Exception('error getting items'));
              return userBloc;
            },
            act: (bloc) => bloc.add(UsersLoad()),
            expect: [UserLoading(), UserOperationFailure()],
          );
        },
      );
    },
  );

  group(
    'Item Bloc',
        () {
      test('throws AssertionError if WeatherRepository is null', () {
        expect(
              () => UserBloc(userRepository: null),
          throwsA(isAssertionError),
        );
      });

      group(
        'ItemRequested',
            () {
          final User mockItem = User(
              email: "qwewqre@gmail.com",
              fName: "qwewqre",
              password: "qwewqre@44",
              phone: "0986413545",
              role: "ADMIN",
              imageUrl: "images/StateBags.jpg");

          final List<User> mockGetItem = [
            User(
                email: "qwewqre@gmail.com",
                fName: "qwewqre",
                password: "qwewqre@44",
                phone: "0986413545",
                role: "ADMIN",
                imageUrl: "images/StateBags.jpg"),
            User(
                email: "qwewqre@gmail.com",
                fName: "qwewqre",
                password: "qwewqre@44",
                phone: "0986413545",
                role: "ADMIN",
                imageUrl: "images/StateBags.jpg"),

            User(
              email: "qwewqre@gmail.com",
              fName: "qwewqre",
              password: "qwewqre@44",
              phone: "0986413545",
              role: "ADMIN",
              imageUrl: "images/StateBags.jpg"),
          ];

          blocTest(
              'emits [ ItemLoadSuccess] when WeatherRequested is added and getWeather succeeds',
              build: () {
                when(userRepository.createUser(mockItem)).thenAnswer(
                      (_) => Future.value(
                    mockItem,
                  ),
                );
                return userBloc;
              },
              act: (bloc) => bloc.add(UsersLoad()),
              expect: [UsersLoadSuccess(mockGetItem)]);

          blocTest(
            'emits [ItemLoad, ItemError] when FetchQuote is added and fetchQuote fails',
            build: () {
              when(userRepository.createUser(mockItem))
                  .thenThrow(Exception('error getting items'));
              return userBloc;
            },
            act: (bloc) => bloc.add(UsersLoad()),
            expect: [UserOperationFailure()],
          );
        },
      );
    },
  );
}