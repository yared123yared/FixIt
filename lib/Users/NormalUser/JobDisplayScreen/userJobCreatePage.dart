import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Job/bloc/job_bloc.dart';
import 'package:flutter_group_project/Features/Job/models/job.dart';
import 'package:flutter_group_project/Features/User/util/util.dart';
import 'package:flutter_group_project/Features/User/User.dart' as models;
import 'package:flutter_group_project/Users/Common/BoxDecoration.dart';
import 'package:flutter_group_project/Users/NormalUser/JobDisplayScreen/map_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
     String latitude;
     String longitude;
     String address = "choose location...";
  @override
  Widget build(BuildContext context) {
    print("build - Latitude $latitude, longitude $longitude");
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit Job" : "Add New Job"}'),
      ),
      body:
      FutureBuilder(
        future: this.getUserInfo() ,
      builder: (context,snapshot) {
        if (snapshot.hasData) {
          models.User user = snapshot.data;

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      TextFormField(
                          initialValue: widget.args.edit ? widget.args.job
                              .jobName : '',
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter Job Name';
                            }
                            return null;
                          },
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Job Name'
                          ), //InputDecoration(labelText: 'Job Name'),
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

                          ),
                          // InputDecoration(labelText: 'job description'),
                          onSaved: (value) {
                            this._job["description"] = value;
                          }),
//
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$address"),
                          SizedBox(width: 10,),
                          IconButton(
                            icon: Icon(Icons.location_on),
                            onPressed: () async {
                              Position position = await Geolocator.getCurrentPosition(
                                  desiredAccuracy: LocationAccuracy.high);
                              LatLng loaction=LatLng(position.latitude, position.longitude);
                              final LocationArgument location = await Navigator
                                  .push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapScreen(
                                      args: MapArgument(location: loaction,isUser: true),
                                    )),
                              );
                              setState(() {
                                latitude = location.latitude;
                                longitude = location.longitude;
                                address = location.address;
                              });
                              print(latitude);
                              print(longitude);
                            },
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            print("job create");
                            final form = _formKey.currentState;
                            if (form.validate()) {
                              form.save();
                              final JobEvent event = widget.args.edit
                                  ? JobUpdate(
                                Job(
                                    jobId: widget.args.job.jobId,
                                    jobName: this._job["jobName"],
                                    description: this._job["description"],
                                    userId: user.UserId,
                                    location: this._job["location"],
                                    technicianId: widget.args.technicianId,
                                    acceptanceStatus: this
                                        ._job['accepteStatus'],
                                    doneStatus: this._job["doneStatus"]
                                ),
                              )
                                  : JobCreate(
                                Job(
                                    jobName: this._job["jobName"],
                                    description: this._job["description"],
                                    userId: user.UserId,
                                    location: "${this.latitude
                                        .toString()},${this
                                        .longitude.toString()},${this.address}",
                                    technicianId: widget.args.technicianId,
                                    acceptanceStatus: 'not accepted',
                                    doneStatus: 'not done'
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
          );
        }
        else {
          return Container();
        }
      }
    ),
    );
  }
  Future<models.User> getUserInfo() async{
    Util util= new Util();
    final user = await util.getUserInformation();
    return user;
  }
}
