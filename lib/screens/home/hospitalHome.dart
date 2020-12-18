import 'package:dbapp/screens/authenticate/authenticate.dart';
import 'package:dbapp/screens/vc/pickuplayout.dart';
import 'package:dbapp/services/auth.dart';
import 'package:dbapp/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:dbapp/shared/drawer.dart';

final myDrawer _drawer = new myDrawer();

class HospitalHome extends StatefulWidget {
  @override
  _HospitalHomeState createState() => _HospitalHomeState();
}

class _HospitalHomeState extends State<HospitalHome> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return PickupLayout(
      scaffold: Scaffold(
          key: _scaffoldKey,
          drawer: _drawer,
          backgroundColor: Colors.white,
          body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 42, 0, 0),
                  child: Row(children: [
                    IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        }),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                      child: Text(
                        "MediStat",
                        style: kTitleTextstyle,
                      ),
                    )
                  ]),
                ),
                SizedBox(height: 40),
                Container(
                    width: 5000.0,
                    height: 400.0,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new AssetImage(
                                'assets/images/hospithome.png')))),
              ])),
    );
  }
}
