import 'dart:math';
import 'package:dbapp/screens/constants/colors.dart';
import 'package:dbapp/models/hospital.dart';
import 'package:dbapp/screens/constants/colors.dart';
import 'package:dbapp/screens/vc/call_utilities.dart';
import 'package:dbapp/screens/vc/dbutils.dart';
import 'package:dbapp/screens/vc/permissions.dart';
import 'package:dbapp/screens/vc/pickuplayout.dart';
import 'package:dbapp/screens/vc/user.dart';
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
  DBUtils db = new DBUtils();

  var sender = new User();
  var receivers = new List<User>();
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    var receiverList = await db.getReceiver();
    //int num=Random().nextInt(receiverList.length);
    print("receiver list from db");
    print(receiverList[0].data);
    var senderInfo = await db.getSender();
    print("sender info");
    print(senderInfo.uid);

    // sender=db.getSender();
    // receiver=db.getReceiver();

    sender.uid = senderInfo.uid;
    sender.email = senderInfo.email;

    for (int i = 0; i < 5 && receiverList.length; i++) {
      print("coming in for i= " + i.toString());
      var currReceiver = new User();
      currReceiver.uid = receiverList[i].data["uid"];
      currReceiver.email = receiverList[i].data["email"];
      receivers.add(currReceiver);
      // print("receiver[i] is ");
      // print(receivers[i]);
    }
    print("reciever list fro initsate");
    print(receiverList);
    // print("receiver");
    // print(receiverList[num].data["uid"]);
    // receiver.uid = receiverList[num].data["uid"];
    // receiver.email = receiverList[num].data["email"];
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
                    style: kTitleTextstyle,
                  ),
                )
              ]),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      // width: MediaQuery.of(context).size.height / 2,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mediBlue.withOpacity(0.3)),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 6 -
                          MediaQuery.of(context).size.height / 6.6,
                      left: MediaQuery.of(context).size.width / 2 -
                          MediaQuery.of(context).size.height / 6.6,
                      child: Container(
                        width: MediaQuery.of(context).size.height / 3.3,
                        height: MediaQuery.of(context).size.height / 3.3,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mediBlue.withOpacity(0.7)),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 6 -
                          MediaQuery.of(context).size.height / 7.4,
                      left: MediaQuery.of(context).size.width / 2 -
                          MediaQuery.of(context).size.height / 7.4,
                      child: InkResponse(
                        onTap: () async {
                          bool permission = await Permissions
                              .cameraAndMicrophonePermissionsGranted();
                          if (permission) {
                            return CallUtils.dial(
                              from: sender,
                              to: receivers,
                              context: context,
                            );
                          } else {
                            return {};
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.height / 3.7,
                          height: MediaQuery.of(context).size.height / 3.7,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.mediBlue),
                          child: Center(
                            child: Text("Get instant help",
                                style: kHeadingTextStyle
                                // TextStyle(color: Colors.white, fontSize: 24),
                                ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40),
                Stack(
                  children: <Widget>[
                    Container(
                      // width: MediaQuery.of(context).size.height / 2,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mediBlue.withOpacity(0.3)),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 6 -
                          MediaQuery.of(context).size.height / 6.6,
                      left: MediaQuery.of(context).size.width / 2 -
                          MediaQuery.of(context).size.height / 6.6,
                      child: Container(
                        width: MediaQuery.of(context).size.height / 3.3,
                        height: MediaQuery.of(context).size.height / 3.3,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mediBlue.withOpacity(0.7)),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 6 -
                          MediaQuery.of(context).size.height / 7.4,
                      left: MediaQuery.of(context).size.width / 2 -
                          MediaQuery.of(context).size.height / 7.4,
                      child: InkResponse(
                        onTap: () => _makingPhoneCall(),
                        child: Container(
                          width: MediaQuery.of(context).size.height / 3.7,
                          height: MediaQuery.of(context).size.height / 3.7,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.mediBlue),
                          child: Center(
                            child: Text("Call an ambulance",
                                style: kHeadingTextStyle
                                // TextStyle(color: Colors.white, fontSize: 24),
                                ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ]),
        )))
      ]),
    );
  }
}
