import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/User/Bloc/User_bloc.dart';
import 'package:flutter_group_project/Features/User/Bloc/User_event.dart';
import 'package:flutter_group_project/Features/User/Bloc/User_state.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Users/Admin/UserManagement/AddUpdateAdmin.dart';
import 'package:flutter_group_project/Users/NormalUser/UserUpdate/AddUpdateUser.dart';
import 'package:flutter_group_project/Users/Common/ScreenRoute.dart';
import 'package:flutter_group_project/Users/Admin/UserManagement/UserDetail.dart';
import 'package:flutter_group_project/Users/Common/login_page.dart';
import 'dart:math';


class CategoryMainScreen extends StatelessWidget {//Main screen for the ADMIM
  static const routeName='/users_screen';
  final User admin;


  CategoryMainScreen({@required this.admin});
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

    //var  selectedCategory= DUMMY_CATEGORIES[randomNumber];
//    List<Service> selectedService=DUMMY_SERVICES;
//     selectedService=DUMMY_SERVICES.where((service) {
//      if(service.id==selectedCategory.id){
//        return true;
//      }
//      return false;
//    }).toList();

    return Scaffold(
      appBar: AppBar(
        // title: Text('${(this.admin?.FullName)}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateAdmin.routeName,
              arguments: UserArgument(user: this.admin, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                BlocProvider.of<UserBloc>(context).add(UserDelete(this.admin));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    SignIn.routeName, (route) => false);
              }),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                isAuthenticated=false;
                isAdmin=false;
                Navigator.of(context).pushNamedAndRemoveUntil(
                    SignIn.routeName, (route) => false);
              }),
        ],
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

                        child: Image.network(
                          "Assets/assets/fixit.png", fit: BoxFit.cover,),

                      ),
//           ingredient
                      buildSectionTitle(context, 'Services'),

        BlocBuilder<UserBloc, UserState>(
          builder: (_, state) {
    if (state is UserOperationFailure) {
    return Text('Could not do Service  operation');
    }
    if (state is UsersLoadSuccess) {
    final user = state.user;
    print("This is the comming user _______________+++++++++++++++++$user");

    return buildContainer(context, ListView.builder(
    itemCount: user.length,
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
              backgroundImage: AssetImage('Assets/Images/${user[index].Picture}'),
            ),



            title: Text(user[index].Email !=null ? user[index].Email : "place holder",
              style: Theme.of(context).textTheme.headline6,),
            subtitle: Text(user[index].FullName !=null ?user[index].FullName: "Place holder" ,),
            trailing: MediaQuery.of(context).size.width > 450 ? FlatButton.icon(
              textColor:Theme.of(context).errorColor,
              icon: Icon(Icons.delete_forever,color: Theme.of(context).errorColor,),





            ): IconButton(
                icon: Icon(Icons.star_border,color: Theme.of(context).errorColor,),



            ),
            onTap: () => Navigator.of(context).pushNamed(UserDetail.routeName, arguments:user[index]),
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

                    ]
                ),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AddUpdateUser.routeName,
          arguments: UserArgument(edit: false),
        ),
        child: Icon(Icons.add),
      ),

//        floatingActionButton: getFloatingButton(context),
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//        bottomNavigationBar: BottomAppBar(
//          color: Theme.of(context).primaryColor,
//          shape: CircularNotchedRectangle(),
//          child: Row(
//              mainAxisSize: MainAxisSize.max,
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                IconButton(
//                  icon: Icon(Icons.search),
//                  color: Colors.white,
//                  onPressed: () {
//                    print("search icon button have been clicked");
//                  },
//                ),
//                IconButton(
//                  icon: Icon(Icons.note),
//                  color: Colors.white,
//                  onPressed: () {
//                    print("the note icon button have been clicked");
//                  },
//                )
//              ]),
//        )

    );
  }
}