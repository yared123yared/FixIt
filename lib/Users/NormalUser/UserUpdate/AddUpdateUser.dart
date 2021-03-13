import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Role/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Role/bloc/role_bloc.dart';
import 'package:flutter_group_project/Features/Role/data_provider/role_data.dart';
import 'package:flutter_group_project/Features/Role/models/role.dart';
import 'package:flutter_group_project/Features/User/Bloc/bloc.dart';
import 'package:flutter_group_project/Features/User/Model/models.dart';
import 'package:flutter_group_project/Users/Admin/admin.dart';
import 'package:flutter_group_project/Users/Common/ScreenRoute.dart';

import '../../../ScreenRoute.dart';



class AddUpdateUser extends StatefulWidget {//Add and Update page only for the Admin
  static const routeName = '/userAddUpdateee';
  final UserArgument args;

  AddUpdateUser({this.args}){
    print("Admin UPdate Create Page");
  }
  @override
  _AddUpdateUserState createState() => _AddUpdateUserState();
}

class _AddUpdateUserState extends State<AddUpdateUser> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _user = {};
  String _myValue ;
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
                    initialValue: widget.args.edit ? widget.args.user.Email : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },

                    decoration: InputDecoration(labelText: 'Email'),
                    onSaved: (value) {
                      setState(() {
                        this._user["Email"] = value;
                      });
                    }),
                TextFormField(
                    initialValue:
                    widget.args.edit ? widget.args.user.FullName : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'FullName'),
                    onSaved: (value) {
                      this._user["FullName"] = value;
                    }),
                TextFormField(
                    initialValue: widget.args.edit
                        ? widget.args.user.Phone
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
                        this._user["Phone"] = value;
                      });
                    }),
                TextFormField(
                    initialValue: widget.args.edit
                        ? widget.args.user.Password
                        : '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                    onSaved: (value) {
                      setState(() {
                        this._user["Password"] = value;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final form = _formKey.currentState;
                      if (form.validate()) {
                        form.save();
//                                Rolee role= new Rolee(roleName: this._user["Role"]
                        print("${this._user["Email"]+this._user["FullName"]+this._user["Phone"]+this._user["Password"]}");
                        final UserEvent event = widget.args.edit
                            ? UserUpdate(//If edit it will update or Creates new user


                          User(
                            UserId: widget.args.user.UserId,
                            Email: this._user["Email"],
                            FullName: this._user["FullName"],
                            Phone: this._user["Phone"],
                            Password: this._user["Password"],
                            Picture: 'Assets/assets/Fixit.png',
                            RoleId: widget.args.user.RoleId,
                          ),
                        )
                            : UserCreate(
                          User(

                            Email: this._user["Email"],
                            FullName: this._user["FullName"],
                            Phone: this._user["Phone"],
                            Password: this._user["Password"],
                            Picture: 'Assets/assets/Fixit.png',
                            Role: this._user["Role"],
                          ),
                        );
                        print("Created");
                        BlocProvider.of<UserBloc>(context).add(event);
                        print("After bloc");
                        Navigator.of(context).pop();
//                                Navigator.of(context).pushNamedAndRemoveUntil(
//                                    AdminMainPage.routeName, (route) => false);
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
