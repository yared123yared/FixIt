import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/Service/Bloc/bloc.dart';
import 'package:flutter_group_project/Features/Service/Model/models.dart';
import 'package:flutter_group_project/Users/NormalUser/ServiceDisplayScreen/userServiceDetailPage.dart';

import '../../../ScreenRoute.dart';

class UserCategoryMain extends StatelessWidget {
  static const routeName='/user/category';

  final texts =['Building','Mechanical','Electr','Metal','Plumbing','Wood'];
  final images =['building.jpg','mechanical.jpg','electric.jpg','metal.jpg','plumbing.png','wood.jpg'];

  @override
  Widget build(BuildContext context) {
    print("displaying ");
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child:BlocProvider.value(
        value: BlocProvider.of<ServiceBloc>(context),
        child: BlocBuilder<ServiceBloc,ServiceState>(
          builder:(_,state){
                if (state is ServiceOperationFailure) {
                return Text('Could not do Service  operation');
                }
                if (state is ServicesLoadSuccess) {
                  final services = state.services;
                  print("Totoal services $services");
                  return GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(6, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            List<Service> service =[];
//                            services.foreach()(e) {
//                              print("Yes_1");
//                              if(e.Category.toLowerCase() == texts[index].toLowerCase()){
//                                print("yes");
//                                service.add(e);
//                              }
//                            }) ;
                            services.forEach((e) {
                              print("yes_1");
                                  if(e.Category.toLowerCase() == texts[index].toLowerCase()){
                                    print("yes");
                                    service.add(e);
                                  }
                            });
                            print("services $service");
                            Navigator.of(context).pushNamed(UserServiceDetail.routeName, arguments:CategoryArgument(services:service,title: texts[index],image: images[index]));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GridTile(
                              child: Image.asset('Assets/Images/${images[index]==null? 'electronics.jpg': images[index] }',
                                fit: BoxFit.cover,),
                              footer: GridTileBar(
                                title: Text(texts[index],textAlign: TextAlign.center,),
                                // backgroundColor: Color(0xffe8b21c),
                                // backgroundColor: Theme.of(context).accentColor,
                                backgroundColor: Colors.black87,
                                leading: IconButton(
                                  color: Colors.amberAccent,
                                  icon:  Icon(Icons.favorite) ,
                                  onPressed: (){

                                  },

                                ),


                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }
                return CircularProgressIndicator();
          }

        ),
      ),
    );
}
  }
