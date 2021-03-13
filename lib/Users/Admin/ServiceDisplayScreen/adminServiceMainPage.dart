import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Service/Service.dart';
import 'package:flutter_group_project/ScreenRoute.dart';

import 'dart:math';

import '../../../dummy_data.dart';
import '../admin.dart';

class AdminServiceMainPage extends StatelessWidget {
  static const routeName='/admin/service';
  Widget buildSectionTitle(BuildContext context, String text){
    return  Container(

      margin: EdgeInsets.symmetric(
        vertical: 10,

      ),
      child: Text('${text}',
        style: Theme.of(context).textTheme.headline6,),
    );
  }

  Widget buildContainer(BuildContext context , Widget child){
    return Container(
      height: MediaQuery.of(context).size.height * 0.5 ,
      width:MediaQuery.of(context).size.width * 0.90 ,
      decoration: BoxDecoration(
        color:Colors.white,
        border:Border.all(
            color:Colors.grey
        ),
        borderRadius: BorderRadius.circular(10),


      ),
      child:child,
    );
  }
//

//
  Widget getFloatingButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      onPressed: () {
        // this is the home optiion
        print('welcome to the home');
      },
      tooltip: "Home",
      child: Icon(Icons.home),
    );
  }
  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int randomNumber = random.nextInt(6);
    print(randomNumber);
    var  selectedCategory= DUMMY_CATEGORIES[randomNumber];
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .width * 0.5,
                  width: double.infinity,

                  child: Image.network(
                    selectedCategory.imageUrl, fit: BoxFit.cover,),

                ) ,
//           ingredient
                buildSectionTitle(context, 'Services'),
                BlocProvider.value(
                  value: BlocProvider.of<ServiceBloc>(context),
                  child: BlocBuilder<ServiceBloc, ServiceState>(
                      builder: (_, state) {
                        if (state is ServiceOperationFailure) {
                          return Text('Could not do Service  operation');
                        }
                        if (state is ServicesLoadSuccess) {
                          final services = state.services;
                          print("This is the comming service _______________+++++++++++++++++$services");
                          return buildContainer(context, ListView.builder(
                              itemCount: services.length,
                              itemBuilder: (ctx, index) =>
                                  Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Theme.of(context).accentColor,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          height: MediaQuery.of(context).size.height * 0.15,
                                          margin: EdgeInsets.all(4),
                                          padding: EdgeInsets.all(4),
                                          child: Card(
                                            elevation: 5,
                                            margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),

                                            child: Center(
                                              child: ListTile(
                                                leading: CircleAvatar(
                                                  backgroundImage: AssetImage('Assets/assets/fixit.png'),
                                                ),
                                                title: Text(services[index].ServiceName !=null ? services[index].ServiceName : "place holder",
                                                  style: Theme.of(context).textTheme.headline6,),
                                                subtitle: Text(services[index].Description !=null ?services[index].Description: "Place holder" ,),
                                                trailing: MediaQuery.of(context).size.width > 450 ? FlatButton.icon(
                                                  onPressed: (){},
                                                  textColor:Theme.of(context).errorColor,
                                                  icon: Icon(Icons.delete_forever,color: Theme.of(context).errorColor,),
                                                ): IconButton(
                                                  icon: Icon(Icons.star_border,color: Theme.of(context).errorColor,),



                                                ),
                                                onTap: () => Navigator.of(context).pushNamed(AdminServiceDetail.routeName, arguments:services[index]),
                                              ),
//            onTap: (){
//              print(this.index);
//              Navigator.pushNamed(context, ServiceMainScreen.routeName,arguments: selectedService[index].ServiceName);
//            },
                                            ),
                                          ),


                                        )]
                                  )
                          ));
                        }
                        return CircularProgressIndicator();
                      }
                  ),
                ),
              ]
          ),
        ),
     floatingActionButton: FloatingActionButton(
       onPressed: () => Navigator.of(context).pushNamed(
         AdminServiceCreate.routeName,
         arguments: ServiceArgument(edit: false),
       ),
       child: Icon(Icons.add),
     ),


    );
  }
}