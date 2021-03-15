import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Service/Service.dart';
import 'package:flutter_group_project/Users/Admin/admin.dart';

import '../../../ScreenRoute.dart';

const _kTitleTextStyle = TextStyle(
    color: Color(0xffe6020a), fontSize: 24.0, fontWeight: FontWeight.bold);
// const _kServiceTitleTextStyle = TextStyle(
//     color: Color(0xffe602ba), fontSize: 18.0, fontWeight: FontWeight.bold);
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch ,
          children: [
            Card(
              margin: EdgeInsets.only(bottom: 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              elevation: 5.0,
              borderOnForeground: true,
              shadowColor: Colors.grey,
              child: Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "${this.service.ServiceName}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        "${this.service.Category}",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey,fontSize: 18.0),
                      ),
                    ),
                    Divider(thickness: 2.0,),
                    Container(
                      padding: EdgeInsets.only( bottom: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child:  Row(
                              children: [
                                Text(
                                  'Initial Price: ',
                                  style: TextStyle(color: Colors.green[500],fontSize: 18,fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$${this.service.InitialPrice}',
                                  style: TextStyle(color: Colors.red[900],fontSize: 18,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  'Intermediate Price: ',
                                  style: TextStyle(color: Colors.green[500],fontSize: 18,fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$${this.service.IntermediatePrice}',
                                  style: TextStyle(color: Colors.red[900],fontSize: 18,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child:  Row(
                              children: [
                                Text(
                                  'Advanced Price: ',
                                  style: TextStyle(color: Colors.green[500],fontSize: 18,fontWeight: FontWeight.bold),

                                ),
                                Text(
                                  '\$${this.service.AdvancedPrice}',
                                  style: TextStyle(color: Colors.red[900],fontSize: 18,fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Description',style: TextStyle(
                    fontSize: 25,
                  ),),
                  SizedBox(height: 12.0,),
                  Text('${this.service.Description}',style: TextStyle(
                    fontSize:18.0,


                  ),),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
