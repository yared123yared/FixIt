import 'package:flutter/material.dart';
import 'package:flutter_group_project/Users/Common/login_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(SignIn());

    // Create the Finders.
    var keyloginTitle=Key('loginPageTitle');
    // final titleFinder = find.byKey(keyloginTitle);
    expect(find.byKey(keyloginTitle), findsOneWidget);

  });
}
