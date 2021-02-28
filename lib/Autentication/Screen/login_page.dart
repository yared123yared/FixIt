import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_project/Autentication/Bloc/User_bloc.dart';
import 'package:flutter_group_project/Autentication/Bloc/User_event.dart';
import 'package:flutter_group_project/Autentication/Bloc/User_state.dart';
import 'package:flutter_group_project/Autentication/Screen/signup_page.dart';

import 'User_main_screen.dart';
import 'package:toast/toast.dart';

class SignIn extends StatefulWidget {
  static const routeName = 'loginPage';
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool ispassshow = false;
  bool _rememberme = false;
  final _myemailController = TextEditingController();
  final _myPasswordController = TextEditingController();

  //String _password, _email;


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Colors.grey[200],
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(100)),
                          gradient: LinearGradient(
                              colors: <Color>[Colors.orange[800], Colors.orange],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        SizedBox(
                      width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.05),
                      Text(
                            'Fix It',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: displayHeight(context) * 0.06,
                                color: Colors.white
                            ),
                          ),
                            Container(
                                                      color: Colors.transparent,
                                                      height: MediaQuery.of(context).size.height/3.5,
                                                      width: MediaQuery.of(context).size.width/3.5 ,
                                                      child:new Image.asset(
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
                                    'Login',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: displayWidth(context) * 0.03,
                                        color: Colors.white
                                    ),
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
                            Material(
                              elevation: 6.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              child: TextField(

                                controller: _myemailController,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () =>
                                    FocusScope.of(context).nextFocus(),
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(Icons.email),
                                  border: InputBorder.none,
                                  hintText: "Enter the Email ",
                                ),
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width*0.5,
                                height: MediaQuery.of(context).size.height*0.01),
                            Material(
                              elevation: 6.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              child: TextField(
                                controller: _myPasswordController,
                                obscureText: !ispassshow,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                onEditingComplete: () =>
                                    FocusScope.of(context).unfocus(),
                                style: TextStyle(fontSize: 18, color: Colors.grey),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 14),
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
                                  hintText: "Enter the Password ",
                                ),
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width*0.5,
                                height: MediaQuery.of(context).size.height*0.01),
                            Row(
                              children: [
                                Checkbox(
                                    checkColor: Colors.white,
                                    value: _rememberme,
                                    activeColor: Colors.orange,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberme = !_rememberme;
                                      });
                                    }),
                                Text("Remember me"),
                              ],
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width*0.5,
                                height: MediaQuery.of(context).size.height*0.01),

                            gradientbutton(),

                            SizedBox(
                                width: MediaQuery.of(context).size.width*0.5,
                                height: MediaQuery.of(context).size.height*0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don\'t have and account ?",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                SizedBox(width: 10,),
                         GestureDetector(
                          onTap: () => _pushPage(context, Register()),
                          child: new Text(

                            "Signup",
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
  Widget gradientbutton() {
    return SizedBox(
        //width: MediaQuery.of(context).size.width*0.5,
        height: MediaQuery.of(context).size.height*0.04,
    child: InkWell(
      splashColor: Colors.white,
      onTap: (){
        //TODO
        //_showToast(context);
        //Toast.show(_myemailController.text, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        //Toast.show(_myPasswordController.text, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        // showDialog(
        //   context: context,
        //   builder: (context) {
        //     return AlertDialog(
        //       // Retrieve the text the user has entered by using the
        //       // TextEditingController.
        //       content: Text(_myPasswordController.text),
        //     );
        //   },
        // );
        final UserEvent event = UserLoad(_myemailController.text);

        BlocProvider.of<UserBloc>(context).add(event);
        BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
        if (state is UserOperationFailure) {
        return Text('Could not do course operation');
        }

        if (state is UserLoadSuccess) {
        final user = state.user;
        if (user.password==_myPasswordController){
        if(user.role=="USER"){
        Navigator.of(context).pushNamed( CategoryMainScreen.routeName, arguments:user);
        }
        else if (user.role=="ADMIN")
        {
        Navigator.of(context).pushNamedAndRemoveUntil(
        CategoryMainScreen.routeName, (route) => false);
        }
        else if (user.role=="TECHNICIAN")
        {
        Navigator.of(context).pushNamedAndRemoveUntil(
        CategoryMainScreen.routeName, (route) => false);
        }
        return null;}
        else{
    Toast.show("Incorrect Email/password", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    }
        // return ListView.builder(
        //   Navigator.of(context).pushNamed(CourseDetail.routeName, arguments: courses[idx]),
        //   ),

        }

        return CircularProgressIndicator();

      });
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
                'LOG IN',
                style: TextStyle(
                    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    ));
  }
}
Size displaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}