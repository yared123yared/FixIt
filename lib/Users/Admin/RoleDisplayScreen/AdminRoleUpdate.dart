import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Role/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Role/models/models.dart';
import 'package:flutter_group_project/Users/Admin/RoleDisplayScreen/adminRoleMainPage.dart';


class RoleAddUpate  extends StatefulWidget {
  static const routeName = "/roleAddUpdate";
  final RoleArguments args;
  RoleAddUpate ({this.args});
  @override
  _AddUpdateRoleState createState() => _AddUpdateRoleState();
}

class _AddUpdateRoleState extends State<RoleAddUpate > {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _role = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit Role" : "Add New Role"}'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      initialValue:
                          widget.args.edit ? widget.args.role.roleName : '',
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Role Name';
                        }
                        return null;
                      },
                      // TODO
                      // decoration: textInputDecoration.copyWith(
                      //     hintText:
                      //         'Role Name'), //InputDecoration(labelText: 'Role Name'),
                      onSaved: (value) {
                        setState(() {
                          this._role["roleName"] = value;
                        });
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        print("rolecreate");
                        final form = _formKey.currentState;
                        if (form.validate()) {
                          form.save();
                          final RoleEvent event = widget.args.edit
                              ? RoleUpdate(
                                  Role(
                                    roleId: widget.args.role.roleId,
                                    roleName: this._role["roleName"],
                                    // acceptanceStatus:this._role['accepteStatus'],
                                    // doneStatus: this._role["doneStatus"]
                                  ),
                                )
                              : RoleCreate(
                                  Role(
                                    roleName: this._role["roleName"],
                                    // acceptanceStatus:this._role['accepteStatus'],
                                    // doneStatus: this._role["doneStatus"]
                                  ),
                                );
                          print('creating role');
                          BlocProvider.of<RoleBloc>(context).add(event);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AdminRoleMainPage.routeName, (route) => false);
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
