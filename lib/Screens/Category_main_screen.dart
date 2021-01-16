import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../dummy_data.dart';
import '../Model/Service.dart';


class CategoryMainScreen extends StatelessWidget {
  static const routeName='/category_screen';



  List<Service> services = [
    Service(id:1, title:"Fix Stove",imageUrl:'fixit.png',categoryId:1, description:'Repair stove that is not working well'),
    Service(id:2, title:"Fix Frige",imageUrl:'fixit.png',categoryId:1, description:'Repair stove that is not working well'),
    Service(id:3, title:"Fix Metad",imageUrl:'fixit.png',categoryId:2, description:'Repair stove that is not working well'),
    Service(id:4, title:"Fix Stove",imageUrl:'fixit.png',categoryId:3, description:'Repair stove that is not working well'),
    Service(id:5, title:"Fix Stove",imageUrl:'fixit.png',categoryId:2, description:'Repair stove that is not working well'),
    Service(id:6, title:"Fix Stove",imageUrl:'fixit.png',categoryId:4, description:'Repair stove that is not working well'),
    Service(id:7, title:"Fix Stove",imageUrl:'fixit.png',categoryId:4, description:'Repair stove that is not working well'),
    Service(id:8, title:"Fix Stove",imageUrl:'fixit.png',categoryId:5, description:'Repair stove that is not working well'),
    Service(id:9, title:"Fix Stove",imageUrl:'fixit.png',categoryId:6, description:'Repair stove that is not working well'),
    Service(id:10, title:"Fix Stove",imageUrl:'fixit.png',categoryId:6, description:'Repair stove that is not working well'),
    Service(id:11, title:"Fix Stove",imageUrl:'fixit.png',categoryId:5, description:'Repair stove that is not working well'),

  ];





  Widget buildSectionTitle(BuildContext context, String text){
    return  Container(

      margin: EdgeInsets.symmetric(
        vertical: 10,

      ),
      child: Text('${text}',
        style: Theme.of(context).textTheme.headline6,),
    );
  }
  void makeFavorite(int index){
//    this is the make favorite method

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

    var selectedCategory=DUMMY_CATEGORIES[randomNumber];

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
            itemCount: services.length,
           itemBuilder: (ctx,index) => Column(
             children:[
               buildServiceList(context,index),
             ]


             )

        )),






            ]
        ),
      ),

    );
  }
}