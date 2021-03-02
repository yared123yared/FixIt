import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/job_bloc.dart';
import 'package:flutter_group_project/Features/Job/models/job.dart';
import 'package:flutter_group_project/Users/Common/BoxDecoration.dart';

import '../../../ScreenRoute.dart';
import '../userMainPage.dart';

class UserCreateJob extends StatefulWidget {
  static const routeName='/user/job/create';
  final JobArguments args;
  UserCreateJob({this.args});
  @override
  _UserCreateJobState createState() => _UserCreateJobState();
}

class _UserCreateJobState extends State<UserCreateJob> {
  final _formKey  = GlobalKey<FormState>();

  final Map<String, dynamic> _job = {};
  // final Map<String, dynamic> _job = {};
    final userId = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit Job" : "Add New Job"}'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  TextFormField(
                      initialValue: widget.args.edit ? widget.args.job.jobName : '',

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Job Name';
                        }
                        return null;
                      },
                      decoration: textInputDecoration.copyWith(

                          hintText: 'Job Name'
                      ) ,//InputDecoration(labelText: 'Job Name'),
                      onSaved: (value) {
                        setState(() {
                          this._job["jobName"] = value;
                        });
                      }),
                  SizedBox(height: 10,),
                  TextFormField(
                      maxLines: 5,
                      initialValue:
                      widget.args.edit ? widget.args.job.description : '',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Job description',

                      ) ,// InputDecoration(labelText: 'job description'),
                      onSaved: (value) {
                        this._job["description"] = value;
                      }),
//                  SizedBox(height: 10,),
//                  TextFormField(
//                      initialValue:
//                      widget.args.edit ? widget.args.job.acceptanceStatus : '',
//                      validator: (value) {
//                        if (value.isEmpty) {
//                          return 'Please enter acceptance status';
//                        }
//                        return null;
//                      },
//                      decoration:textInputDecoration.copyWith(
//                          hintText: 'Acceptance Status'
//                      ) , //InputDecoration(labelText: ' acceptance status'),
//                      onSaved: (value) {
//                        setState(() {
//                          this._job["accepteStatus"] = value;
//                        });
//                      }),
//                  SizedBox(height: 10,),
//                  TextFormField(
//                      initialValue:
//                      widget.args.edit ? widget.args.job.doneStatus : '',
//                      validator: (value) {
//                        if (value.isEmpty) {
//                          return 'Please enter Done status';
//                        }
//                        return null;
//                      },
//                      decoration: textInputDecoration.copyWith(
//                          hintText: 'Done Status'
//                      ) ,//InputDecoration(labelText: ' done status'),
//                      onSaved: (value) {
//                        setState(() {
//                          this._job["doneStatus"] = value;
//                        });
//                      }),
                  SizedBox(height: 10,),
                  TextFormField(
                      initialValue:
                      widget.args.edit ? widget.args.job.location : '',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter location ';
                        }
                        return null;
                      },
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Location'
                      ) ,// InputDecoration(labelText: 'location'),
                      onSaved: (value) {
                        setState(() {
                          this._job["location"] = value;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        print("jobcreate");
                        final form = _formKey.currentState;
                        if (form.validate()) {
                          form.save();
                          final JobEvent event = widget.args.edit
                              ? JobUpdate(
                            Job(
                                jobId: widget.args.job.jobId,
                                jobName: this._job["jobName"],
                                description: this._job["description"],
                                userId: userId,
                                location: this._job["location"],
                                technicianId: 1,
                                acceptanceStatus:this._job['accepteStatus'],
                                doneStatus: this._job["doneStatus"]
                            ),
                          )
                              : JobCreate(
                            Job(
                                jobName: this._job["jobName"],
                                description: this._job["description"],
                                userId: userId,
                                location: this._job["location"],
                                technicianId: 1,
                                acceptanceStatus: 'not',
                                doneStatus: 'not'
                            ),
                          );
                          print('creating job');
                          BlocProvider.of<JobBloc>(context).add(event);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              UserMain.routeName, (route) => false);
                        }
                      },
                      label: Text('SAVE'),
                      icon: Icon(Icons.save),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

      ),
    );
  }
}
