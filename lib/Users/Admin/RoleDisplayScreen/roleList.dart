import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Role/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Role/models/models.dart';
import 'package:flutter_group_project/Role/Admin/Role/role.dart';

class RolesList extends StatelessWidget {
  int _index = 0;
  static const routeName = "/roles";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocBuilder<RoleBloc, RoleState>(
        builder: (_, state) {
          if (state is RoleOperationFailure) {
            return Text('Could not do role operation');
          }
          if (state is RoleLoadingSuccess) {
            final roles = state.roles;

            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: roles.length,
              itemBuilder: (_, idx) => GestureDetector(
                onTap: () {
                  // Navigator.of(context)
                  //           .pushNamed(AdminRoleDetail.routeName, arguments: roles[idx]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: new FittedBox(
                      child: Material(
                        color: Colors.white,
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(24.0),
                        shadowColor: Color(0x802196F3),
                        child: Column(
                          children: [
                            Text('${roles[idx].roleName}'),
                            Row(
                              children: [
                                RaisedButton(
                                  child: Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        RoleAddUpate.routeName,
                                        arguments: RoleArguments(
                                            role: roles[idx], edit: true));
                                  },
                                ),
                                RaisedButton(
                                  child: Icon(Icons.delete),
                                  onPressed: () {
                                    context
                                        .read<RoleBloc>()
                                        .add(RoleDelete(roles[idx]));
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RoleAddUpate.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class RoleArguments {
  final Role role;
  final bool edit;
  RoleArguments({this.role, this.edit});
}
