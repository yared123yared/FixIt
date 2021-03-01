import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/job_bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/job_event.dart';
import 'package:flutter_group_project/Features/Job/bloc/job_state.dart';
import 'package:flutter_group_project/Features/Job/models/job.dart';
import 'package:flutter_group_project/Features/User/Bloc/bloc.dart';

const _kTitleTextStyle = TextStyle(
    color: Color(0xffe6020a), fontSize: 24.0, fontWeight: FontWeight.bold);
const _kJobTitleTextStyle = TextStyle(
    color: Color(0xffe602ba), fontSize: 18.0, fontWeight: FontWeight.bold);
const _kJobLocationTextStyle =
TextStyle(color: Colors.green, fontSize: 18.0, fontWeight: FontWeight.bold);
const _kDetailsTextStyle = TextStyle(
    color: Colors.black54, fontSize: 16.0, fontWeight: FontWeight.w500);
const _kStatusTextStyle = TextStyle(
    color: Colors.pink, fontSize: 18.0, fontWeight: FontWeight.w500);

class AdminUserDetail extends StatelessWidget {
  static const routeName = '/admin/Features.user/detail';
  final User user;

  AdminUserDetail({this.user});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;

    return BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("${this.user.fullName}"),
              centerTitle: true,
            ),

            body: Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Material(
                color: Colors.white,
                elevation: 0.0,
                borderRadius: BorderRadius.circular(16.0),
                shadowColor: Color(0x802196F3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: buildJobDetail(user),
                      ),
                    ),
                    SizedBox(height: 5),

                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.delete),
              onPressed: () async {
                // await context.read<JobBloc>().add(JobDelete(this.job));
               // await context.read<UserBloc>.add(UserDelete(this.user));
                Navigator.of(context).pop();
                // AdminJobMainPage.routeName, (route) => false);

              },
            ),
          );
        }
    );
  }

  // TODO pass job ass argument
  Widget buildJobDetail(User user) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          children: [
            Text('Job Detail', style: _kTitleTextStyle),
            SizedBox(width: 50,)
          ],
        ),

        Row(
          children: [
            Text("Name: ", style: _kDetailsTextStyle,),
            SizedBox(
              width: 15,
            ),
            Text(
              "${user.fullName}",
            ),
          ],
        ), Row(
          children: [
            Text("Email: ", style: _kDetailsTextStyle,),
            SizedBox(
              width: 15,
            ),
            Text(
              "${user.email}",
            ),
          ],
        ),
        Row(
          children: [
            Text(
                'Role: ${user.role}',
                style: _kStatusTextStyle
            ),
          ],
        ),
        Row(
          children: [
            Text(
                'Phone: ${user.phone}',
                style: _kStatusTextStyle
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Sex: ${user.sex}',
              style: _kDetailsTextStyle,
            ),
          ],
        ),

      ],
    );
  }
}