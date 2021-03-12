import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Authentication/authntication.dart';
import 'package:flutter_group_project/Features/Authentication/repository/AuthenticationRepository.dart';
import 'package:flutter_group_project/Features/Job/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/job_bloc.dart';
import 'package:flutter_group_project/Features/Job/data_provider/job_data.dart';
import 'package:flutter_group_project/Features/Job/repository/job_repository.dart';
import 'package:flutter_group_project/Features/Role/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Role/data_provider/data__provider.dart';
import 'package:flutter_group_project/Features/Role/repository/repository.dart';
import 'package:flutter_group_project/Features/User/Bloc/bloc.dart';
import 'package:flutter_group_project/Features/User/Data_provider/data_provider.dart';
import 'package:flutter_group_project/Features/User/Repository/repository.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:flutter_group_project/Users/Technicians/technicianMainPage.dart';
import 'package:flutter_group_project/bloc_observer.dart';
import 'package:http/http.dart' as http;
import 'Features/Authentication/data_provider/Auth_Data.dart';
import 'Features/Service/Service.dart';
import 'ScreenRoute.dart';
import 'Users/Common/ScreenRoute.dart';
import 'Users/users.dart';

void main()
{
  Bloc.observer = SimpleBlocObserver();
  ServiceDataProvider serviceDataProvider=new ServiceDataProvider(httpClient: http.Client(),);

  final ServiceRepository serviceRepository = ServiceRepository(
    dataProvider:serviceDataProvider
  );
  //
  JobDataProvider jobDataProvider = JobDataProvider(httpClient: http.Client());
  final JobRepository jobRepository = JobRepository(dataProvider: jobDataProvider);
  //
  RoleDataProvider roleDataProvider = RoleDataProvider(httpClient: http.Client());
  final RoleRepository roleRepository = RoleRepository(dataProvider: roleDataProvider);
  //
  UserDataProvider userDataProvider= UserDataProvider(httpClient: http.Client());
  final UserRepository userRepository=UserRepository(dataProvider: userDataProvider);
  //
  AuthDataProvider authDataProvider= AuthDataProvider(httpClient: http.Client());
  final AuthenticationRepository authenticationRepository=AuthenticationRepository(authDataProvider: authDataProvider);
  runApp(
    FixIt(serviceRepository: serviceRepository,
      jobRepository: jobRepository,
      roleRepository: roleRepository,
      userRepository: userRepository,
    authenticationRepository: authenticationRepository,),
  );


}
class FixIt extends StatelessWidget {
  final ServiceRepository serviceRepository;
  final JobRepository jobRepository;
  final RoleRepository roleRepository;
  final UserRepository userRepository;
  final AuthenticationRepository authenticationRepository;

  FixIt({
    @required this.serviceRepository,
    @required this.jobRepository,
    @required this.roleRepository,
    @required this.userRepository,
  @required this.authenticationRepository})
      : assert(serviceRepository != null && jobRepository != null && roleRepository != null);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ServiceBloc>(
            create: (_) => ServiceBloc(serviceRepository: this.serviceRepository,util: Util())
              ..add(ServiceLoad()),
          ),
          BlocProvider<JobBloc>(
            create: (_) => JobBloc(jobRepository: this.jobRepository,util: Util())
              ..add(JobLoad()),
          ),
          BlocProvider<RoleBloc>(
            create: (_) => RoleBloc(roleRepository: this.roleRepository,util: Util())
                ..add(RoleLoad()),
          ),
          BlocProvider<UserBloc>(
              create: (_) => UserBloc(userRepository: this.userRepository,util: Util())
                  ..add(UsersLoad())
          ),
          BlocProvider<AuthBloc>(
              create: (_) => AuthBloc(authRepository: this.authenticationRepository,util: Util())..add(AutoLoginEvent())
          ),
        ],
      child: MyApp(),
    );

  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.purple,
          canvasColor: Color.fromRGBO(225, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 31, 51, 1),
              ),
              headline6:
              TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'))),

      initialRoute:TechnicianMainPage.routeName,
      onGenerateRoute: ServiceAppRoute.generateRoute,
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (ctx) => CategoryMainScreen());
      // },
    );
  }
}
//
//
// this is the previoud main.dart file to be updated soon

