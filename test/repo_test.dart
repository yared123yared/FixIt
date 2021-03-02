// import 'package:flutter_group_project/Features/User/Data_provider/data_provider.dart';
// import 'package:flutter_group_project/Features/User/Repository/repository.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class MockItemApiClient extends Mock implements UserDataProvider {}

// void main() {
//   group('assertion', () {
//     test('should assert if null', () {
//       expect(
//         () => UserRepository(dataProvider: null),
//         throwsA(isAssertionError),
//       );
//     });
//   });

//   group('fetchQuote', () {
//     final mockQuoteRepository =
//         UserRepository(dataProvider: MockItemApiClient());
//     test('should called fetchQuote from QuoteApiClient', () async {
//       when(mockQuoteRepository.getUsers()).thenAnswer((_) async {
//         return Future.value();
//       });

//       mockQuoteRepository.getUsers();

//       verify(mockQuoteRepository.getUsers()).called(1);
//     });
//   });
// }
