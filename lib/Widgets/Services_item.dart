import 'package:flutter/material.dart';
import '../Screens/Service_main_screen.dart';
import '../Model/Service.dart';

import '../dummy_data.dart';

class ServiceItem extends StatelessWidget {

  final int index;

  final List<Service> selectedService;
  ServiceItem(this.index, this.selectedService);
  void makeFavorite(int index){
      print( index);


  }
  @override
  Widget build(BuildContext context) {

    return  Container(
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
              backgroundImage: AssetImage('Assets/Images/${selectedService[index].imageUrl}'),
            ),



            title: Text(selectedService[index].title,
              style: Theme.of(context).textTheme.headline6,),
            subtitle: Text(selectedService[index].description,),
            trailing: MediaQuery.of(context).size.width > 450 ? FlatButton.icon(
              textColor:Theme.of(context).errorColor,
              icon: Icon(Icons.star_border),
              onPressed: ()=>makeFavorite(selectedService[index].id),
              label:Text("Favorite"),




            ): IconButton(
                icon: Icon(Icons.star_border,color: Theme.of(context).errorColor,),
                onPressed: ()=>makeFavorite(selectedService[index].id)


            ),
            onTap: (){
              print(this.index);
              Navigator.pushNamed(context, ServiceMainScreen.routeName,arguments: selectedService[index].title);
            },
          ),
        ),

      ),
    );
  }
}
