import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/service/bloc/bloc.dart';
import 'package:flutter_group_project/service/models/models.dart';
import 'package:flutter_group_project/service/screens/service_route.dart';
import 'package:flutter_group_project/service/screens/shared.dart';

import 'service_list.dart';

class AddUpdateService extends StatefulWidget {
  static const routeName = "serviceAddUpdate";
  final ServiceArguments args;
  AddUpdateService({this.args});
  @override
  _AddUpdateServiceState createState() => _AddUpdateServiceState();
}

class _AddUpdateServiceState extends State<AddUpdateService> {
  final _formKey  = GlobalKey<FormState>();

  final Map<String, dynamic> _service = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit Service" : "Add New Service"}'),
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
                      initialValue: widget.args.edit ? widget.args.service.serviceName : '',

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Service Name';
                        }
                        return null;
                      },
                      decoration: textInputDecoration.copyWith(

                          hintText: 'Service Name'
                      ) ,//InputDecoration(labelText: 'Service Name'),
                      onSaved: (value) {
                        setState(() {
                          this._service["serviceName"] = value;
                        });
                      }),
                  SizedBox(height: 10,),
                  TextFormField(
                      maxLines: 5,
                      initialValue:
                      widget.args.edit ? widget.args.service.description : '',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Service description',

                      ) ,// InputDecoration(labelText: 'service description'),
                      onSaved: (value) {
                        this._service["description"] = value;
                      }),
                  SizedBox(height: 10,),
                  TextFormField(
                      initialValue:
                      widget.args.edit ? widget.args.service.acceptanceStatus : '',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter acceptance status';
                        }
                        return null;
                      },
                      decoration:textInputDecoration.copyWith(
                          hintText: 'Acceptance Status'
                      ) , //InputDecoration(labelText: ' acceptance status'),
                      onSaved: (value) {
                        setState(() {
                          this._service["accepteStatus"] = value;
                        });
                      }),
                  SizedBox(height: 10,),
                  TextFormField(
                      initialValue:
                      widget.args.edit ? widget.args.service.doneStatus : '',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Done status';
                        }
                        return null;
                      },
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Done Status'
                      ) ,//InputDecoration(labelText: ' done status'),
                      onSaved: (value) {
                        setState(() {
                          this._service["doneStatus"] = value;
                        });
                      }),
                  SizedBox(height: 10,),
                  TextFormField(
                      initialValue:
                      widget.args.edit ? widget.args.service.location : '',
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
                          this._service["location"] = value;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        print("servicecreate");
                        final form = _formKey.currentState;
                        if (form.validate()) {
                          form.save();
                          final ServiceEvent event = widget.args.edit
                              ? ServiceUpdate(
                            Service(
                              serviceId: widget.args.service.serviceId,
                              serviceName: this._service["serviceName"],
                              description: this._service["description"],
                              userId: 1,
                              location: this._service["location"],
                              technicianId: 1,
                              // acceptanceStatus:this._service['accepteStatus'],
                              // doneStatus: this._service["doneStatus"]
                            ),
                          )
                              : ServiceCreate(
                            Service(
                              serviceName: this._service["serviceName"],
                              description: this._service["description"],
                              userId: 1,
                              location: this._service["location"],
                              technicianId: 1,
                              // acceptanceStatus:this._service['accepteStatus'],
                              // doneStatus: this._service["doneStatus"]
                            ),
                          );
                          print('creating service');
                          BlocProvider.of<ServiceBloc>(context).add(event);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              ServicesList.routeName, (route) => false);
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
