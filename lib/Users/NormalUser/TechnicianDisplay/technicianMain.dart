import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Service/Model/models.dart';
import 'package:flutter_group_project/Features/Technician/bloc/technician_bloc.dart';
import 'package:flutter_group_project/Features/Technician/bloc/technician_state.dart';
import 'package:flutter_group_project/Features/Technician/models/models.dart';
import 'package:flutter_group_project/Users/NormalUser/TechnicianDisplay/technicianDetail.dart';
import 'package:flutter_group_project/dummy_data.dart';

class UserTechnicianMain extends StatelessWidget {
  static const routeName = '/user/category/services/technicians';

  final Service service;
  UserTechnicianMain({this.service});

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
      appBar: AppBar(
        title: Text('Technicians'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .width * 0.5,
                width: double.infinity,

                child: Center(child: Text(service.ServiceName,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                  fontSize: 40

                ),),),

              ),
//           ingredient
              buildSectionTitle(context, 'Technicians'),
              BlocProvider.value(
                value: BlocProvider.of<TechnicianBloc>(context),
                child: BlocBuilder<TechnicianBloc, TechnicianState>(
                    builder: (_, state) {
                      if (state is TechnicianOperationFailure) {
                        return Text('Could not do Technician  operation');
                      }
                      if (state is TechnicianLoadingSuccess) {
                        final techs = state.jobs;
                        List<Technician> technicians = [];
                        techs.forEach((element) {
                          if(element.department.toLowerCase() == service.Category.toLowerCase()){
                            technicians.add(element);
                          }
                        });
                        print("This is the comming technician _______________+++++++++++++++++$technicians");
                        return buildContainer(context, ListView.builder(
                            itemCount: technicians.length,
                            itemBuilder: (ctx, index) =>
                                Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white38,
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
                                                backgroundImage: AssetImage('Assets/Images/${technicians[index].user.picture}'),
                                              ),
                                              title: Text(technicians[index].user.fullName !=null ? technicians[index].user.fullName : "place holder",
                                                style: Theme.of(context).textTheme.headline6,),
                                              subtitle: Text(technicians[index].department !=null ?technicians[index].department: "Place holder" ,),
                                              trailing: MediaQuery.of(context).size.width > 450 ? FlatButton.icon(
                                                onPressed: (){},
                                                textColor:Theme.of(context).errorColor,
                                                icon: Icon(Icons.delete_forever,color: Theme.of(context).errorColor,),
                                              ): IconButton(
                                                icon: Icon(Icons.star_border,color: Theme.of(context).errorColor,),



                                              ),
                                              onTap: (){
                                                print("I am printing the details of the techinicains");
                                                Navigator.of(context).pushNamed(UserTechnicianDetail.routeName,arguments: technicians[index]);
                                              }
                                            ),
//            onTap: (){
//              print(this.index);
//              Navigator.pushNamed(context, TechnicianMainScreen.routeName,arguments: selectedTechnician[index].TechnicianName);
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



    );
  }
}
