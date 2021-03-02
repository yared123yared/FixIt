import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Fixit final app test', () {
    //signup
    var nameField = find.byValueKey('signUpNameField');
    var textFieldEmail = find.byValueKey('signUpEmailField');
    var textFieldPassword = find.byValueKey('signUpPasswordField');
    var textFieldPhone = find.byValueKey('signUpPhoneField');
    var signUpLoginButton = find.byValueKey('signUpLoginButton');
    var signUpButton = find.byValueKey('signUpButton');

    //login
    var textFieldEmailForLoin = find.byValueKey('emailField');
    var textFieldPasswordFoLogin = find.byValueKey('passwordField');
    var loginSignUpButton = find.byValueKey('loginSignUpButton');
    var loginButton = find.byValueKey('loginButton');
    var logOutButton = find.byValueKey('logOutButton');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // tearDownAll(() {
    //   if (driver != null) {
    //     driver.close();
    //   }
    // });

    test('login to fixit', () async {
      await driver.tap(textFieldEmailForLoin);
      await driver.enterText('yared.com');
      await driver.tap(textFieldPasswordFoLogin);
      await driver.enterText('1');
      await driver.tap(loginButton);
      // TODO : list tasks after login
      await driver.tap(logOutButton);
      // await driver.tap(resultClub1);
      // await driver.enterText('3');
      // await driver.tap(resultClub2);
      // await driver.enterText('2');
      // await driver.tap(resultSave);
    });


    // test('signup', () async {
    //   await driver.tap(loginSignUpButton);
    //   await driver.tap(nameField);
    //   await driver.enterText('Yosef Endale');
    //   await driver.tap(textFieldEmail);
    //   await driver.enterText('getch@gmail.com');
    //   await driver.tap(textFieldPhone);
    //   await driver.enterText('0989121345');
    //   await driver.tap(textFieldPassword);
    //   await driver.enterText('yosefendale');
    //   await driver.tap(signUpButton);
    // });
  });
}
