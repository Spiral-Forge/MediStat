import 'package:dbapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

_makingPhoneCall() async { 
  const url = 'tel:102'; 
  if (await canLaunch(url)) { 
    await launch(url); 
  } else { 
    throw 'Could not launch $url'; 
  } 
} 

class _HomePageState extends State<HomePage> {
  // var themeFlag = false;
  // final FirebaseAuth _authUser = FirebaseAuth.instance;
  // bool loading = true;
  // String post;
  // bool postFlag = false;
  // static List<dynamic> peerID = [];
  // List fixedList = Iterable<int>.generate(peerID.length).toList();
  // Future<FirebaseUser> getCurrentUser() {
  //   return _authUser.currentUser();
  // }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: Column(children: [
        Expanded(
            child: Container(
                child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(children: [
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
                    style: TextStyle(fontFamily: 'GoogleSans', fontSize: 23),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 90,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkResponse(
                    onTap: () => print("coolcoolcool"),
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.MediBlue),
                      child: Center(
                        child: Text(
                          "Get instant help",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    )),
                SizedBox(height: 40),
                InkResponse(
                    onTap: () => _makingPhoneCall(),
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.MediBlue),
                      child: Center(
                        child: Text(
                          "Call an ambulance",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    )),
              ],
            )
          ]),
        )))
      ]),
    );
  }
}
