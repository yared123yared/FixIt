import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Role/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Role/data_provider/data__provider.dart';
import 'package:flutter_group_project/Features/Role/repository/repository.dart';
import 'package:flutter_group_project/Features/job/bloc/bloc.dart';
import 'package:flutter_group_project/Features/job/job.dart';

import 'package:flutter_group_project/bloc_observer.dart';
import 'package:http/http.dart' as http;
import 'Features/Service/Service.dart';
import 'Users/users.dart';



void main()
{
  Bloc.observer = SimpleBlocObserver();
  ServiceDataProvider serviceDataProvider=new ServiceDataProvider(httpClient: http.Client(),);
  final ServiceRepository serviceRepository = ServiceRepository(
    dataProvider:serviceDataProvider
  );

  JobDataProvider jobDataProvider = JobDataProvider(httpClient: http.Client());
  final JobRepository jobRepository = JobRepository(dataProvider: jobDataProvider);
  runApp(
    FixIt(serviceRepository: serviceRepository,jobRepository: jobRepository,),
  );

  RoleDataProvider roleDataProvider = RoleDataProvider(httpClient: http.Client());
  final RoleRepository roleRepository = RoleRepository(dataProvider: roleDataProvider);
}




class FixIt extends StatelessWidget {
  final ServiceRepository serviceRepository;
  final JobRepository jobRepository;
  final RoleRepository roleRepository;

  FixIt({@required this.serviceRepository, @required this.jobRepository,@required this.roleRepository})
      : assert(serviceRepository != null && jobRepository != null && roleRepository != null);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ServiceBloc>(
            create: (_) => ServiceBloc(serviceRepository: this.serviceRepository)
              ..add(ServiceLoad()),
          ),
          BlocProvider<JobBloc>(
            create: (_) => JobBloc(jobRepository: this.jobRepository)
              ..add(JobLoad()),
          ),
          BlocProvider<RoleBloc>(
            create: (_) => RoleBloc(roleRepository: this.roleRepository)

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

      initialRoute: UserMain.routeName,
      onGenerateRoute: ServiceAppRoute.generateRoute,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryMainScreen());
      },
    );
  }
}



//
//
// this is the previoud main.dart file to be updated soon

