import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/Services_item.dart';
import 'dart:math';
import '../dummy_data.dart';
import '../Model/Service.dart';


class CategoryMainScreen extends StatelessWidget {
  static const routeName='/category_screen';
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

  @override
  Widget build(BuildContext context) {

    Random random = new Random();
    int randomNumber = random.nextInt(6);

    print(randomNumber);

    var  selectedCategory= DUMMY_CATEGORIES[randomNumber];
    List<Service> selectedService=DUMMY_SERVICES;
     selectedService=DUMMY_SERVICES.where((service) {
      if(service.id==selectedCategory.id){
        return true;
      }
      return false;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Category Name'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children:[
              Container(
                height: MediaQuery.of(context).size.width * 0.5 ,
                width: double.infinity,

                child: Image.network(selectedCategory.imageUrl,fit: BoxFit.cover,),

              ),
//           ingredient
              buildSectionTitle(context,'Services'),
        buildContainer(context,ListView.builder(
            itemCount: selectedService.length,
           itemBuilder: (ctx,index) => Column(
             children:[
               ServiceItem(index,selectedService),
             ]


             )

        )),






            ]
        ),
      ),

    );
  }
}