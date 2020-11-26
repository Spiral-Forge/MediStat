import 'package:dbapp/constants/colors.dart';
import 'package:dbapp/screens/authenticate/registerUser.dart';
import 'package:dbapp/screens/authenticate/userAuthHandler.dart';
import 'package:flutter/material.dart';
import 'package:dbapp/shared/loading.dart';
// ignore: unused_import
import 'package:dbapp/screens/authenticate/registerHospital.dart';

import 'authenticate.dart';

int visibleCard = 1;

String post = '';

Map<String, dynamic> userMap = {'type': ''};

class RegisterForm1 extends StatefulWidget {
  //taken from parent props:
  final Function toggleView;
  RegisterForm1({this.toggleView});
  @override
  _RegisterForm1State createState() => _RegisterForm1State();
}

class _RegisterForm1State extends State<RegisterForm1> {
  // final AuthService _auth = AuthService();
  final _formKey1 = GlobalKey<FormState>();

  String error = '';
  bool loading = false;

  void initState() {
    super.initState();
    setState(() {
      post = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: loading
            ? Loading()
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: new Container(
                    padding: EdgeInsets.only(top: 60.0),
                    child: Form(
                        key: _formKey1,
                        child: ListView(shrinkWrap: true, children: <Widget>[
                          new Divider(height: 35.0, color: Colors.transparent),
                          Container(
                            width: 20,
                            height: 150,
                            // decoration: new BoxDecoration(
                            //     image: new DecorationImage(
                            //         image: new AssetImage(
                            //                 'assets/images/Protege_white_text.png')))
                          ),
                          new Divider(height: 55.0, color: Colors.transparent),
                          new Text(
                            'Hey,' + '\n' + 'register yourself as',
                            style: TextStyle(
                              fontFamily: 'GoogleSans',
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          new Divider(height: 32.0, color: Colors.transparent),
                          Column(children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  userMap['type'] = 'Hospital';
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                         builder: (context) => UserAuthHandler())
                                        );
                              },
                              child: Container(
                                  // height: 40,
                                  padding: EdgeInsets.symmetric(horizontal: 55),
                                  child: Material(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.MediBlue,
                                      child: Container(
                                        height: 40,
                                        alignment: Alignment.center,
                                        child: Text('Hospital',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'GoogleSans'),
                                            textAlign: TextAlign.center),
                                      ))),
                            ),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  userMap['post'] = 'User';
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserAuthHandler())
                                        );
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 55),
                                  child: Material(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.MediBlue,
                                      child: Container(
                                        height: 40,
                                        alignment: Alignment.center,
                                        child: Text('User',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'GoogleSans'),
                                            textAlign: TextAlign.center),
                                      ))),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Already registered? ',
                                    style: TextStyle(
                                      fontFamily: 'GoogleSans',
                                      fontSize: 14.5,
                                    )),
                                SizedBox(height: 5.0),
                                InkWell(
                                  onTap: () {
                                    widget.toggleView();
                                  },
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    margin: EdgeInsets.symmetric(vertical: 12),
                                    child: Text("Sign In Here",
                                        style: TextStyle(
                                            color: AppColors.MediBlue,
                                            fontSize: 14.5,
                                            fontFamily: 'GoogleSans',
                                            decoration:
                                                TextDecoration.underline)),
                                  ),
                                ),
                              ],
                            )
                          ])
                        ])))));
  }
}
