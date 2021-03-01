import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/User/Bloc/bloc.dart';
import 'package:flutter_group_project/Features/User/Model/models.dart';
import 'package:flutter_group_project/Users/Common/ScreenRoute.dart';
import 'package:flutter_group_project/Users/Admin/UserManagement/User_main_screen.dart';



class AddUpdateAdmin extends StatefulWidget {//Add and Update page only for the Admin
  static const routeName = 'adminAddUpdate';
  final UserArgument args;

  AddUpdateAdmin({this.args});
  @override
  _AddUpdateAdminState createState() => _AddUpdateAdminState();
}

class _AddUpdateAdminState extends State<AddUpdateAdmin> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _user = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('${widget.args.edit ? "Edit Profile" : "Add New Course"}'),
        title: Text("Edit profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.email : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },

                  decoration: InputDecoration(labelText: 'email'),
                  onSaved: (value) {
                    setState(() {
                      this._user["email"] = value;
                    });
                  }),
              TextFormField(
                  initialValue:
                  widget.args.edit ? widget.args.user.fName : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'fName'),
                  onSaved: (value) {
                    this._user["fName"] = value;
                  }),
              TextFormField(
                  initialValue: widget.args.edit
                      ? widget.args.user.phone
                      : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your phonr name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'lName'),
                  onSaved: (value) {
                    setState(() {
                      this._user["phone"] = value;
                    });
                  }),

              DropDownFormField(
                titleText: 'Role',
                hintText: 'Please choose one',
                value: this._user["role"],
                onSaved: (value) {
                  setState(() {
                    this._user["role"] = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    this._user["role"] = value;
                  });
                },
                dataSource: [
                  {
                    "display": "User",
                    "value": "USER",
                  },
                  {
                    "display": "Admin",
                    "value": "ADMIN",
                  },
                  {
                    "display": "Technician",
                    "value": "TECHNICIAN",
                  },
                ],
                textField: 'display',
                valueField: 'value',
              ),
              TextFormField(
                  initialValue: widget.args.edit
                      ? widget.args.user.password
                      : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'password'),
                  onSaved: (value) {
                    setState(() {
                      this._user["password"] = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      final UserEvent event = widget.args.edit
                          ? UserUpdate(//If edit it will update or Creates new user

                        User(
                          email: this._user["email"],
                          fName: this._user["fName"],
                          phone: this._user["phone"],
                          password: this._user["password"],
                          imageUrl: 'this._user["intermediatePrice"]',
                          role: this._user["role"],
                        ),
                      )
                          : UserCreate(
                        User(

                          email: this._user["email"],
                          fName: this._user["fName"],
                          phone: this._user["phone"],
                          password: this._user["password"],
                          imageUrl: 'this._user["intermediatePrice"]',
                          role: this._user["role"],
                        ),
                      );
                      BlocProvider.of<UserBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          CategoryMainScreen.routeName, (route) => false);
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
    );
  }
}
