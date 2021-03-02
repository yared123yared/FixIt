// import 'dart:convert';
// import 'package:flutter_group_project/Features/User/Data_provider/User_data.dart';
// import 'package:flutter_group_project/Features/User/Model/User.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:http/http.dart' as http;

// class MockItemApiClient extends Mock implements UserDataProvider {
//   UserDataProvider _real;

//   MockItemApiClient(http.Client httpClient) {
//     _real = UserDataProvider(httpClient: httpClient);
//     when(getUser("email")).thenAnswer((_) => _real.getUser("email"));
//   }
// }

// class MockHttpClient extends Mock implements http.Client {}

// void main() {
//   group('assertion', () {
//     test('should assert if null', () {
//       expect(
//             () => UserDataProvider(httpClient: null),
//         throwsA(isAssertionError),
//       );
//     });
//   });

//   group('get data', () {
//     final mockHttpClient = MockHttpClient();
//     final mockItemApiClient = MockItemApiClient(mockHttpClient);
//     test('return Item if http call successfully', () async {
//       // given
//       final mockQuoteString ='[{"Email": "abcdefg@gmail.com", "FullName": "abcdefg", "Phone": "0911111111","Password": "myPAssPass","Role": "User","Picture": "images/StateBags.jpg"}]';
//           //'[{"id": "123", "name": "abc", "price": "15","description": "xdskjlckjdb cbbds","imagePath": "images/StateBags.jpg"},{"id": "124", "name": "abc", "price": "16","description": "xdskjlckjdb cbbds","imagePath": "images/StateBags.jpg"}]';
//       final mockItem = jsonDecode(mockQuoteString) as List;
//       final mockItems = mockItem.map((e) => User.fromJson(e)).toList();

//       when(mockHttpClient.get('http://10.0.2.2:8181/api/items?limit=5&page=1'))
//           .thenAnswer(
//               (_) async => Future.value(http.Response(mockQuoteString, 200)));

//       expect(await mockItemApiClient.getUser("abcdefg@gmail.com"), mockItems);
//     });

//     test('return Exception if http call error', () async {
//       when(mockHttpClient.get('http://10.0.2.2:8181/api/items?limit=5&page=1'))
//           .thenAnswer((_) async =>
//           Future.value(http.Response('error getting quotes', 202)));

//       expect(
//               () async => await mockItemApiClient.getUser("abcdefg@gmail.com"), throwsA(isException));
//     });
//   });
// }
