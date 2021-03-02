import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Authentication/bloc/auth.dart';
import 'package:flutter_group_project/Features/Authentication/data_provider/Auth_Data.dart';
import 'package:flutter_group_project/Features/Authentication/repository/AuthenticationRepository.dart';
import 'package:flutter_group_project/Features/Job/bloc/job_bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/job_event.dart';
import 'package:flutter_group_project/Features/Job/job.dart';
import 'package:flutter_group_project/Features/Role/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Role/bloc/role_bloc.dart';
import 'package:flutter_group_project/Features/Role/data_provider/data__provider.dart';
import 'package:flutter_group_project/Features/Role/repository/role_repository.dart';
import 'package:flutter_group_project/Features/Service/Bloc/Service_bloc.dart';
import 'package:flutter_group_project/Features/Service/Bloc/Service_event.dart';
import 'package:flutter_group_project/Features/Service/Service.dart';
import 'package:flutter_group_project/Features/User/Bloc/bloc.dart';
import 'package:flutter_group_project/Features/User/Data_provider/User_data.dart';
import 'package:flutter_group_project/Features/User/Repository/User_repository.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:flutter_group_project/ScreenRoute.dart';
import 'package:flutter_group_project/Users/Common/signup_page.dart';
import 'package:flutter_group_project/bloc_observer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocObserver();
  ServiceDataProvider serviceDataProvider = new ServiceDataProvider(
    httpClient: http.Client(),
  );

  final ServiceRepository serviceRepository =
      ServiceRepository(dataProvider: serviceDataProvider);
  //
  JobDataProvider jobDataProvider = JobDataProvider(httpClient: http.Client());
  final JobRepository jobRepository =
      JobRepository(dataProvider: jobDataProvider);
  //
  RoleDataProvider roleDataProvider =
      RoleDataProvider(httpClient: http.Client());
  final RoleRepository roleRepository =
      RoleRepository(dataProvider: roleDataProvider);
  //
  UserDataProvider userDataProvider =
      UserDataProvider(httpClient: http.Client());
  final UserRepository userRepository =
      UserRepository(dataProvider: userDataProvider);
  //
  AuthDataProvider authDataProvider =
      AuthDataProvider(httpClient: http.Client());
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository(authDataProvider: authDataProvider);

  testWidgets("Sign Up PAge", (WidgetTester tester) async {
    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider<ServiceBloc>(
          create: (_) => ServiceBloc(serviceRepository: serviceRepository)
            ..add(ServiceLoad()),
        ),
        BlocProvider<JobBloc>(
          create: (_) => JobBloc(jobRepository: jobRepository)..add(JobLoad()),
        ),
        BlocProvider<RoleBloc>(
          create: (_) =>
              RoleBloc(roleRepository: roleRepository)..add(RoleLoad()),
        ),
        BlocProvider<UserBloc>(
            create: (_) =>
                UserBloc(userRepository: userRepository, util: Util())
                  ..add(UsersLoad())),
        BlocProvider<AuthBloc>(
            create: (_) => AuthBloc(
                authRepository: authenticationRepository, util: Util())),
      ],
      child: MaterialApp(
        home: Register(),
        onGenerateRoute: ServiceAppRoute.generateRoute,
      ),
    ));
    await tester.pumpAndSettle(Duration(seconds: 30));
    var nameField = find.byKey(Key('signUpNameField'));
    var textFieldEmail = find.byKey(Key('signUpEmailField'));
    var textFieldPassword = find.byKey(Key('signUpPasswordField'));
    var textFieldPhone = find.byKey(Key('signUpPhoneField'));
    var signupButtonLogin = find.byKey(Key('signUpLoginButton'));
    var signUpButton = find.byKey(Key('signUpButton'));

    expect(textFieldEmail, findsOneWidget);
    expect(textFieldPassword, findsOneWidget);
    expect(nameField, findsOneWidget);
    expect(textFieldPhone, findsOneWidget);
    expect(textFieldPassword, findsOneWidget);
    expect(signupButtonLogin, findsOneWidget);
    expect(signUpButton, findsOneWidget);
  });
}
