import 'package:flutter/material.dart';
import 'package:flutter_group_project/User/Screen/UserDetail.dart';
import '../Model/User.dart';

class ServiceItem extends StatelessWidget {

  final int index;

  final List<User> selectedService;
  ServiceItem(this.index, this.selectedService);
  void makeFavorite(String email){
      print( email );
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



            title: Text(selectedService[index].fName !=null ? (selectedService[index].fName+" "+selectedService[index].phone) : "No name yet :(",
              style: Theme.of(context).textTheme.headline6,),
            subtitle: Text(selectedService[index].role !=null ?selectedService[index].role: "No role yet :(" ,),
            trailing: MediaQuery.of(context).size.width > 450 ? FlatButton.icon(
              textColor:Theme.of(context).errorColor,
              icon: Icon(Icons.delete_forever,color: Theme.of(context).errorColor,),
              onPressed: ()=>makeFavorite(selectedService[index].email),
              label:Text("Give Role"),




            ): IconButton(
                icon: Icon(Icons.edit,color: Theme.of(context).errorColor,),
                onPressed: ()=>makeFavorite(selectedService[index].email)


            ),
            onTap: () => Navigator.of(context).pushNamed(UserDetail.routeName, arguments:selectedService[index]),
          ),
//            onTap: (){
//              print(this.index);
//              Navigator.pushNamed(context, ServiceMainScreen.routeName,arguments: selectedService[index].ServiceName);
//            },
          ),
        ),


    );
  }
}
