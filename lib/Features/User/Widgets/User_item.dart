import 'package:flutter/material.dart';
import 'package:flutter_group_project/Users/Admin/UserManagement/UserDetail.dart';
import '../Model/User.dart';

class UserItem extends StatelessWidget {

  final int index;

  final List<User> selectedUser;
  UserItem(this.index, this.selectedUser);
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
              backgroundImage: AssetImage('Assets/assets/fixit.png'),
            ),



            title: Text(selectedUser[index].fName !=null ? (selectedUser[index].fName) : "No name yet :(",
              style: Theme.of(context).textTheme.headline6,),
            subtitle: Text(selectedUser[index].role !=null ?selectedUser[index].role: "No role yet :(" ,),
            trailing: MediaQuery.of(context).size.width > 450 ? FlatButton.icon(
              textColor:Theme.of(context).errorColor,
              icon: Icon(Icons.delete_forever,color: Theme.of(context).errorColor,),
              onPressed: ()=>makeFavorite(selectedUser[index].email),
              label:Text("Give Role"),




            ): IconButton(
                icon: Icon(Icons.edit,color: Theme.of(context).errorColor,),
                onPressed: ()=>makeFavorite(selectedUser[index].email)


            ),
            onTap: () => Navigator.of(context).pushNamed(UserDetail.routeName, arguments:selectedUser[index]),
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
