
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Role/bloc/bloc.dart';
import 'package:flutter_group_project/Features/Role/models/models.dart';
import 'package:flutter_group_project/Users/Admin/RoleDisplayScreen/AdminRoleUpdate.dart';

class AdminRoleMainPage extends StatelessWidget {
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
            print("Role is loading");
            final roles = state.roles;

            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: roles.length,
              itemBuilder: (_, idx) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                    width: width*0.15,
                  height: height*0.3,
                  child: new FittedBox(
                    child: Material(
                      color: Theme.of(context).primaryColor,
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10.0),
                      shadowColor: Color(0x802196F3),
                      child: Column(
                        children: [
                          Text('${roles[idx].roleName}'),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                iconSize: 10,
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      RoleAddUpate.routeName,
                                      arguments: RoleArguments(
                                          role: roles[idx], edit: true));
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                iconSize: 10,
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
          print('create');
          Navigator.of(context).pushNamed(RoleAddUpate.routeName,arguments:RoleArguments(edit:false));
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
