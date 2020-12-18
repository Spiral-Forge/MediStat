import 'package:dbapp/screens/home/home.dart';
import 'package:dbapp/screens/home/hospitalHome.dart';
import 'package:dbapp/services/miniauth.dart';
import 'package:dbapp/shared/loading.dart';
import 'package:flutter/material.dart';

class HomeHandler extends StatefulWidget {
  @override
  _HomeHandlerState createState() => _HomeHandlerState();
}

class _HomeHandlerState extends State<HomeHandler> {
  bool hospital;
  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() async {
    AuthMethods auth = new AuthMethods();
    var user = await auth.getUserDetails();
    if (user.type == "user") {
      setState(() {
        hospital = false;
      });
    } else {
      setState(() {
        hospital = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hospital == null) {
      return Loading();
    } else if (hospital) {
      return HospitalHome();
    } else {
      return Home();
    }
  }
}
