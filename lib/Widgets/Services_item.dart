import 'package:flutter/material.dart';
import '../Model/Service.dart';

import '../dummy_data.dart';

class ServiceItem extends StatelessWidget {

  final int index;

  final List<Service> selectedService;
  ServiceItem(this.index, this.selectedService);
  void makeFavorite(int index){
//    this is the make favorite method

  }
  @override
  Widget build(BuildContext context) {

    return  Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),

      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('Assets/Images/${selectedService[index].imageUrl}'),
        ),



        title: Text(selectedService[index].title,
          style: Theme.of(context).textTheme.headline6,),
        subtitle: Text(selectedService[index].description),
        trailing: MediaQuery.of(context).size.width > 450 ? FlatButton.icon(
          textColor:Theme.of(context).errorColor,
          icon: Icon(Icons.star_border),
          onPressed: ()=>makeFavorite(selectedService[index].id),
          label:Text("Favorite"),


        ): IconButton(
            icon: Icon(Icons.star_border,color: Theme.of(context).errorColor,),
            onPressed: ()=>makeFavorite(selectedService[index].id)


        ),
      ),

    );
  }
}
