import 'package:dbapp/screens/authenticate/loginUser.dart';
import 'package:dbapp/screens/authenticate/onboard.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;


  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return UserLogin();
    } else {
      return RegisterForm1();
    }
  }
}
