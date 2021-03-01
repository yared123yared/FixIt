import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Features/User/Bloc/User_bloc.dart';
import 'package:flutter_group_project/Features/User/Bloc/User_event.dart';
import 'package:flutter_group_project/Features/User/Bloc/bloc.dart';
import 'package:flutter_group_project/Features/User/Model/User.dart';
import 'package:flutter_group_project/Users/Admin/UserManagement/User_main_screen.dart';
import 'package:flutter_group_project/Users/NormalUser/UserUpdate/Users_main.dart';
import 'package:flutter_group_project/Users/Technicians/TechnicianUpdate/Technician_main.dart';
import 'package:toast/toast.dart';

import 'ScreenRoute.dart';
import 'loading_screen.dart';
import 'login_page.dart';

class Register extends StatefulWidget {
  static const routeName = 'registerPage';
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool ispassshow = false;
  final _myemailController = TextEditingController();
  final _mynameController = TextEditingController();
  final _myPhoneController = TextEditingController();
  final _myPasswordController = TextEditingController();

  //String _password, _email;


  @override
  Widget build(BuildContext context) {
    var asd=17.50;
    return BlocConsumer<UserBloc, UserState>(
        listener:(_,state){
          if(state is UserLoadSuccess){
            if(state.user.password==_myPasswordController.text){
              if(state.user.role=="ADMIN"){
                Navigator.of(context).pushReplacementNamed(CategoryMainScreen.routeName, arguments: UserArgument(user: user));
              }else if(state.user.role=="TECHNICIAN"){
                Navigator.of(context).pushReplacementNamed(Technician_main.routeName, arguments: UserArgument(user: user));
              }else{
                Navigator.of(context).pushReplacementNamed(Users_main.routeName, arguments: UserArgument(user: user));
              }
            }
            else{
              Toast.show("Incorrect Email/password combination", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
            }
          }
          if(state is UserLoading){
            loading_screen(title:"Login loading");
          }
          if(state is UserOperationFailure){
            Toast.show("Login operation failed :(", context, backgroundColor: Colors.red, textColor: Colors.white, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
          }
        },
        builder:(_,state) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius:
                                BorderRadius.only(
                                    bottomLeft: Radius.circular(100)),
                                gradient: LinearGradient(
                                    colors: <Color>[
                                      Colors.orange[800],
                                      Colors.orange
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.5,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.05),
                                Text(
                                  'Fix It',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: displayHeight(context) * 0.06,
                                      color: Colors.white),
                                ),
                                Container(
                                  color: Colors.transparent,
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height / 3.5,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width / 3.5,
                                  child: new Image.asset(
                                    'Assets/assets/fixit.png',
                                    // width: 600.0,
                                    // height: 240.0,
                                    //fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 22),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        width: displayHeight(context) * 0.25,
                                        child: Text(
                                          'Sign Up',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: displayWidth(context) *
                                                  0.03,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      Expanded(
                          child: Container(
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.05,
                                      child: Material(
                                        elevation: 6.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                40)),
                                        child: TextField(
                                          controller: _mynameController,
                                          keyboardType: TextInputType
                                              .emailAddress,
                                          textInputAction: TextInputAction.next,
                                          onEditingComplete: () =>
                                              FocusScope.of(context)
                                                  .nextFocus(),
                                          style: TextStyle(
                                              fontSize: asd,
                                              color: Colors.grey),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 14),
                                            prefixIcon: Icon(Icons.email),
                                            border: InputBorder.none,
                                            hintText: "Enter Your Name ",
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.5,
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.01),
                                  SizedBox(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.05,
                                      child: Material(
                                        elevation: 6.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                40)),
                                        child: TextField(
                                          controller: _myemailController,
                                          keyboardType: TextInputType
                                              .emailAddress,
                                          textInputAction: TextInputAction.next,
                                          onEditingComplete: () =>
                                              FocusScope.of(context)
                                                  .nextFocus(),
                                          style: TextStyle(
                                              fontSize: asd,
                                              color: Colors.grey),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 14),
                                            prefixIcon: Icon(Icons.email),
                                            border: InputBorder.none,
                                            hintText: "Enter Your Email ",
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.5,
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.01),
                                  SizedBox(
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.05,
                                    child: Material(
                                      elevation: 6.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              40)),
                                      child: TextField(
                                        controller: _myPasswordController,
                                        obscureText: !ispassshow,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.done,
                                        onEditingComplete: () =>
                                            FocusScope.of(context).unfocus(),
                                        style: TextStyle(
                                            fontSize: asd, color: Colors.grey),
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              top: 14),
                                          prefixIcon: Icon(Icons.lock),
                                          border: InputBorder.none,
                                          suffixIcon: IconButton(
                                            icon: Icon(ispassshow
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                            onPressed: () {
                                              setState(() {
                                                ispassshow = !ispassshow;
                                              });
                                            },
                                          ),
                                          hintText: "Enter Your Password ",
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.5,
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.01),
                                  SizedBox(
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.05,
                                      child: Material(
                                        elevation: 6.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                40)),
                                        child: TextField(
                                          controller: _myPhoneController,
                                          keyboardType: TextInputType
                                              .emailAddress,
                                          textInputAction: TextInputAction.next,
                                          onEditingComplete: () =>
                                              FocusScope.of(context)
                                                  .nextFocus(),
                                          style: TextStyle(
                                              fontSize: asd,
                                              color: Colors.grey),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                top: 14),
                                            prefixIcon: Icon(Icons.email),
                                            border: InputBorder.none,
                                            hintText: "Enter Your Phone ",
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.5,
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.01),
                                  SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.5,
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.03),
                                  gradientbutton(state),
                                  SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.5,
                                      height:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .height * 0.01),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Already have an account ?",
                                        style: TextStyle(
                                            color: Colors.grey[700]),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () =>
                                            _pushPage(context, SignIn()),
                                        child: new Text(
                                          "Log in",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        });

  }
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }
  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  Widget gradientbutton(UserState state) {
    UserState _state=state;
    return InkWell(
      splashColor: Colors.white,
      onTap: (){
        final UserEvent event = UserCreate(
          User(

            email: _myemailController.text,
            fName: _mynameController.text,
            phone: _myPhoneController.text,
            password: _myPasswordController.text,
            imageUrl: 'this._user["intermediatePrice"]',
            role: 'this._user["advancedPrice"]',
          ),
        );
        BlocProvider.of<UserBloc>(context).add(event);
        if (state is UserOperationFailure) {
          Toast.show("Login operation failed :(", context, backgroundColor: Colors.red, textColor: Colors.white, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        }



      },
      // onTap: () => _pushPage(context, Register()),
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 6.0,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[Colors.orange, Colors.orange[800]]),
              borderRadius: BorderRadius.circular(40)),
          height: 60,
          width: MediaQuery.of(context).size.width * 0.75,
          child: Center(
              child: Text(
                'SIGN UP',
                style: TextStyle(
                    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}