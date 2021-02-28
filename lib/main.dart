import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Autentication/Bloc/bloc.dart';
import 'package:flutter_group_project/Autentication/Repository/repository.dart';
import 'package:flutter_group_project/Autentication/Screen/login_page.dart';
import 'Autentication/Data_provider/User_data.dart';
import 'bloc_observer.dart';
import 'package:http/http.dart' as http;


Future<void >main() async{
  Bloc.observer = SimpleBlocObserver();

  final UserRepository userRepository = UserRepository(
    dataProvider: UserDataProvider(
      httpClient: http.Client(),
    ),
  );

  runApp(MyApp(userRepository: userRepository,));
}

class MyApp extends StatelessWidget{
  final UserRepository userRepository;
  MyApp({@required this.userRepository})
      :assert(userRepository!=null);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.userRepository,
      child: BlocProvider(
        create: (context) => UserBloc(userRepository: this.userRepository),

        child: MaterialApp(
          home: SignIn(),
          // home: CategoryMainScreen(),
          debugShowCheckedModeBanner: false,
        ),),
    );
  }
}