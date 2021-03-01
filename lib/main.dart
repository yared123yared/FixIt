import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/job/bloc/bloc.dart';
import 'package:flutter_group_project/Features/job/job.dart';
import 'package:flutter_group_project/Role/Admin/admin.dart';
import 'package:flutter_group_project/Role/User/Job/userJobMainPage.dart';
import 'package:flutter_group_project/Role/User/userMainPage.dart';
import 'package:flutter_group_project/bloc_observer.dart';
import 'package:http/http.dart' as http;
import 'Features/Service/Service.dart';



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
}




class FixIt extends StatelessWidget {
  final ServiceRepository serviceRepository;
  final JobRepository jobRepository;

  FixIt({@required this.serviceRepository, @required this.jobRepository})
      : assert(serviceRepository != null && jobRepository != null);

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

        ],

      child: MyApp(),
    );
    /*
    return RepositoryProvider.value(
      value: this.courseRepository,
      child: BlocProvider(
        create: (context) => CourseBloc(courseRepository: this.courseRepository)
          ..add(CourseLoad()),
        child: MaterialApp(
          title: 'Course App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: CourseAppRoute.generateRoute,
        ),
      ),
    );
    */
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

