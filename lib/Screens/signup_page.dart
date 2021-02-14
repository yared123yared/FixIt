import 'package:flutter/material.dart';

import 'login_page.dart';
import 'package:toast/toast.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                          Text(
                            "Flutter",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              child: FlutterLogo(
                                size: 40,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(right: 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Login",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                                )
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
                              height: 20,
                            ),
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
                              height: 20,
                            ),
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
                              height: 20,
                            ),
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
                              height: 20,
                            ),
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
                              height: 20,
                            ),
                            // Expanded(
                            //     child: MaterialButton(
                            //       color: Colors.orange,
                            //       splashColor: Colors.blue,
                            //       shape: RoundedRectangleBorder(
                            //           borderRadius: new BorderRadius.circular(18.0),
                            //           side: BorderSide(color: Colors.black)),
                            //       child: Text("Sign In",
                            //         style: TextStyle(
                            //             color: Colors.white,
                            //             fontSize: 20
                            //         ),
                            //       ),
                            //       onPressed: () => _pushPage(context, Register()),
                            //
                            //     )),
                            gradientbutton(),

                            SizedBox(
                              height: 10,
                            ),
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
    return InkWell(
      splashColor: Colors.white,
      onTap: (){
        //TODO
        //_showToast(context);
        //Toast.show(_myemailController.text, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        //Toast.show(_myPasswordController.text, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              // Retrieve the text the user has entered by using the
              // TextEditingController.
              content: Text(_myPasswordController.text),
            );
          },
        );

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
                'Login',
                style: TextStyle(
                    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}