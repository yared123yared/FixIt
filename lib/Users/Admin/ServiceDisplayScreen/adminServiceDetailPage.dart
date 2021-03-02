import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Service/Service.dart';
import 'package:flutter_group_project/Users/Admin/admin.dart';

import '../../../ScreenRoute.dart';

const _kTitleTextStyle = TextStyle(
    color: Color(0xffe6020a), fontSize: 24.0, fontWeight: FontWeight.bold);
const _kServiceTitleTextStyle = TextStyle(
    color: Color(0xffe602ba), fontSize: 18.0, fontWeight: FontWeight.bold);
const _kServiceLocationTextStyle =
TextStyle(color: Colors.green, fontSize: 18.0, fontWeight: FontWeight.bold);
const _kDetailsTextStyle = TextStyle(
    color: Colors.black54, fontSize: 16.0, fontWeight: FontWeight.w500);
class AdminServiceDetail extends StatelessWidget {
  static const routeName='/admin/service/detail';
  final Service service;
  AdminServiceDetail({this.service});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        title: Text('${this.service.ServiceName}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AdminServiceCreate.routeName,
              arguments: ServiceArgument(service: this.service, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                BlocProvider.of<ServiceBloc>(context).add(ServiceDelete(this.service));
                Navigator.of(context).pop();
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Service Name: ${this.service.ServiceName}'),
              subtitle: Text('Category: ${this.service.Category}'),
            ),
            Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Description: ${this.service.Description}',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 10,
            ),
            Text('Initial Price: ${this.service.InitialPrice}',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(
              height: 10,
            ),
            Text('Intermediate Price: ${this.service.IntermediatePrice}',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(
              height: 10,
            ),
            Text('Advanced Price: ${this.service.AdvancedPrice}',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
            SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
    );
  }
}
