import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Service/Service.dart';
import 'package:flutter_group_project/Users/Admin/UserManagement/User_main_screen.dart';
import 'package:flutter_group_project/Users/Common/BoxDecoration.dart';

import '../../../ScreenRoute.dart';
import '../admin.dart';




class AdminServiceCreate extends StatefulWidget {
  static const routeName = '/admin/service/create';
  final ServiceArgument args;

  AdminServiceCreate({this.args});
  @override
  _AddUpdateServiceState createState() => _AddUpdateServiceState();
}

class _AddUpdateServiceState extends State<AdminServiceCreate> {
  final _formKey = GlobalKey<FormState>();
  String _myValue = "Select Category";

  final Map<String, dynamic> _service = {};
  final categories = [
    {
      "display": "Wood",
      "value": "Wood"
    },
    {
      "display": "Mechanical",
      "value": "Mechanical"
    },
    {
      "display": "Electrical",
      "value": "Electrical"
    },
    {
      "display": "Metal",
      "value": "Metal"
    },
    {
      "display": "Building",
      "value": "Building"
    },
    {
      "display": "Plumbing",
      "value": "Plumbing"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit Course" : "Add New Course"}'),
      ),
      body: ListView(
        children:[ Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                TextFormField(
                    initialValue: widget.args.edit ? widget.args.service.ServiceName : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter course code';
                      }
                      return null;
                    },
                    decoration: textInputDecoration.copyWith(
                        labelText: 'Service Name'
                           ) ,
                    onSaved: (value) {
                      setState(() {
                        this._service["serviceName"] = value;
                      });
                    }),
                SizedBox(height:5),
                DecoratedBox(
                  decoration: ShapeDecoration(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.0, style: BorderStyle.solid, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  child: DropDownFormField(
                      hintText:_myValue ,
                      value:  widget.args.edit ? widget.args.service.Category : ''  ,
                      titleText: "Category",
                      dataSource: categories,



                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Features.Service Category';
                        }
                        return null;
                      },
                      textField: 'display',
                      valueField: 'value',
                      onChanged: (value){
                        setState(() {
                          this._service["category"] = value;
                          _myValue = value;
                        });
                      },
                      onSaved: (value) {
                        setState(() {
                          this._service["category"] = value;
                        });
                      }),
                ),
                SizedBox(height:5),
                TextFormField(
                    initialValue: widget.args.edit
                        ? widget.args.service.InitialPrice.toString()
                        : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Features.Service Initial Pice';
                      }
                      return null;
                    },
                    decoration: textInputDecoration.copyWith(
                        labelText: 'Initial Price'
                    ) ,
                    onSaved: (value) {
                      setState(() {
                        this._service["initialPrice"] = int.parse(value);
                      });
                    }),
                SizedBox(height:5),
                TextFormField(
                    initialValue: widget.args.edit
                        ? widget.args.service.IntermediatePrice.toString()
                        : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Features.Service Intermediate Pice';
                      }
                      return null;
                    },
                    decoration: textInputDecoration.copyWith(
                        labelText: 'Intermediate Price'
                    ) ,
                    onSaved: (value) {
                      setState(() {
                        this._service["intermediatePrice"] = int.parse(value);
                      });
                    }),
                SizedBox(height:5),
                TextFormField(
                    initialValue: widget.args.edit
                        ? widget.args.service.AdvancedPrice.toString()
                        : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Features.Service Advanced Pice';
                      }
                      return null;
                    },
                    decoration: textInputDecoration.copyWith(
                        labelText: 'Advanced Price'
                    ) ,
                    onSaved: (value) {
                      setState(() {
                        this._service["advancedPrice"] = int.parse(value);
                      });
                    }),
                SizedBox(height:5),
                TextFormField(
                  maxLines: 5,
                    initialValue:
                    widget.args.edit ? widget.args.service.Description : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter service  Description';
                      }
                      return null;
                    },
                    decoration: textInputDecoration.copyWith(
                        labelText: 'Description'
                    ) ,
                    onSaved: (value) {
                      this._service["description"] = value;
                    }),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final form = _formKey.currentState;
                      if (form.validate()) {
                        form.save();
                        final ServiceEvent event = widget.args.edit
                            ? ServiceUpdate(

                          Service(
                            id: widget.args.service.id,
                            ServiceName: this._service["serviceName"],
                            Description: this._service["description"],
                            Category: this._service["category"],
                            InitialPrice: this._service["initialPrice"],
                            IntermediatePrice: this._service["intermediatePrice"],
                            AdvancedPrice: this._service["advancedPrice"],
                          ),
                        )
                            : ServiceCreate(
                          Service(

                            ServiceName: this._service["serviceName"],
                            Description: this._service["description"],
                            Category: this._service["category"],
                            InitialPrice: this._service["initialPrice"],
                            IntermediatePrice: this._service["intermediatePrice"],
                            AdvancedPrice: this._service["advancedPrice"],
                          ),
                        );
                        BlocProvider.of<ServiceBloc>(context).add(event);
                        Navigator.of(context).pop();
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
        ]
      ),
    );
  }
}