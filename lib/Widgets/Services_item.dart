import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),

      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('Assets/Images/${services[index].imageUrl}'),
        ),



        title: Text(services[index].title,
          style: Theme.of(context).textTheme.headline6,),
        subtitle: Text(services[index].description),
        trailing: MediaQuery.of(context).size.width > 450 ? FlatButton.icon(
          textColor:Theme.of(context).errorColor,
          icon: Icon(Icons.star_border),
          onPressed: ()=>makeFavorite(services[index].id),
          label:Text("Favorite"),


        ): IconButton(
            icon: Icon(Icons.star_border,color: Theme.of(context).errorColor,),
            onPressed: ()=>makeFavorite(services[index].id)


        ),
      ),

    );
  }
}
