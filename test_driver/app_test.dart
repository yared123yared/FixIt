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

    var adminJobsIcon = find.byValueKey('jobsIcon');
    var adminRolesIcon = find.byValueKey('rolesIcon');
    var adminServicesIcon = find.byValueKey('servicesIcon');
    var adminUsersIcon = find.byValueKey('usersIcon');

    var firstJob = find.byValueKey('job0');
    var firstService = find.byValueKey('service0');

    var adminJobDeleteButton = find.byValueKey('adminJobDeleteButton');
    var adminServiceDeleteButton = find.byValueKey('adminServiceDeleteButton');
    // adminJobDeleteButton
    // adminServiceDeleteButton

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // tearDownAll(() {
    //   if (driver != null) {
    //     driver.close();
    //   }
    // });

    test('login to fixit, logout then signup', () async {
      await driver.tap(textFieldEmailForLoin);
      await driver.enterText('yared.com');
      await driver.tap(textFieldPasswordFoLogin);
      await driver.enterText('1');
      await driver.tap(loginButton);
      // log out
      await driver.tap(logOutButton);
      // sign up
      await driver.tap(loginSignUpButton);
      await driver.tap(nameField);
      await driver.enterText('gech gech');
      await driver.tap(textFieldEmail);
      await driver.enterText('getch@gmail.com');
      await driver.tap(textFieldPhone);
      await driver.enterText('0989121345');
      await driver.tap(textFieldPassword);
      await driver.enterText('getachw');
      await driver.tap(signUpButton);
    });

    test('login to fixit => navigate through Tabs => delete 1 job', () async {
      await driver.tap(textFieldEmailForLoin);
      await driver.enterText('yared.com');
      await driver.tap(textFieldPasswordFoLogin);
      await driver.enterText('1');
      await driver.tap(loginButton);
      // print('login clicked');
      // navigate

      await driver.tap(adminRolesIcon);
      await driver.tap(adminServicesIcon);

      await driver.tap(adminUsersIcon);

      await driver.tap(adminJobsIcon);
      await driver.tap(firstJob);
      await driver.tap(adminJobDeleteButton);
    });

    test('login to fixit => navigate through Tabs => delete 1 service',
        () async {
      await driver.tap(textFieldEmailForLoin);
      await driver.enterText('yared.com');
      await driver.tap(textFieldPasswordFoLogin);
      await driver.enterText('1');
      await driver.tap(loginButton);
      // print('login clicked');
      // navigate

      await driver.tap(adminRolesIcon);
      await driver.tap(adminServicesIcon);
      await driver.tap(adminUsersIcon);
      await driver.tap(adminRolesIcon);
      await driver.tap(adminServicesIcon);

      await driver.tap(firstService);
      await driver.tap(adminServiceDeleteButton);
    });

    test('signup', () async {
      await driver.tap(loginSignUpButton);
      await driver.tap(nameField);
      await driver.enterText('Yosef Endale');
      await driver.tap(textFieldEmail);
      await driver.enterText('getch@gmail.com');
      await driver.tap(textFieldPhone);
      await driver.enterText('0989121345');
      await driver.tap(textFieldPassword);
      await driver.enterText('yosefendale');
      await driver.tap(signUpButton);
    });
  });
}
