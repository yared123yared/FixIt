import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/User/Bloc/bloc.dart';
import 'package:flutter_group_project/Features/User/Model/models.dart';
import 'package:flutter_group_project/Users/Admin/UserManagement/User_main_screen.dart';
import 'package:flutter_group_project/Users/Common/ScreenRoute.dart';



class AddUpdateUser extends StatefulWidget {//Update page for user, Only Updates
  static const routeName = 'userAddUpdate';
  final UserArgument args;

  AddUpdateUser({this.args});
  @override
  _AddUpdateUserState createState() => _AddUpdateUserState();
}

class _AddUpdateUserState extends State<AddUpdateUser> {
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
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Phone'),
                  onSaved: (value) {
                    setState(() {
                      this._user["phone"] = value;
                    });
                  }),
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
                      final UserEvent event =
                          UserUpdate(

                        User(
                          email: this._user["email"],
                          fName: this._user["fName"],
                          phone: this._user["phone"],
                          password: this._user["password"],
                          imageUrl: 'Assets/assets/fixit.png',
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