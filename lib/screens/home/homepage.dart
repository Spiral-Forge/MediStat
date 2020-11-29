import 'package:dbapp/models/user.dart';
import 'package:dbapp/shared/colors.dart';

import 'package:dbapp/services/dbutils.dart';
import 'package:dbapp/services/permissions.dart';
import 'package:dbapp/services/call_utilities.dart';
import 'package:dbapp/shared/drawer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final myDrawer _drawer = new myDrawer();

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
    print("im in init state of homepage");
    super.initState();
    initialize();
  }

  initialize() async {
    print("hello from initialize");
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
    print("receiver list len here");
    print(receiverList.length);
    for (int i = 0; i < receiverList.length && i < 5; i++) {
      print("coming in for i= " + i.toString());
      var currReceiver = new User();
      currReceiver.uid = receiverList[i].data["uid"];
      currReceiver.email = receiverList[i].data["email"];
      receivers.add(currReceiver);
      // print("receiver[i] is ");
      // print(receivers[i]);
    }
    print("reciever list fro initsate");
    print(receivers[0]);
    // setState(() {

    // });
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
      drawer: _drawer,
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
                      height: MediaQuery.of(context).size.height / 3.6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mediBlue.withOpacity(0.3)),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 7.2 -
                          MediaQuery.of(context).size.height / 7.8,
                      left: MediaQuery.of(context).size.width / 2 -
                          MediaQuery.of(context).size.height / 7.8,
                      child: Container(
                        width: MediaQuery.of(context).size.height / 3.9,
                        height: MediaQuery.of(context).size.height / 3.9,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mediBlue.withOpacity(0.7)),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 7.2 -
                          MediaQuery.of(context).size.height / 8.6,
                      left: MediaQuery.of(context).size.width / 2 -
                          MediaQuery.of(context).size.height / 8.6,
                      child: InkResponse(
                        onTap: () async {
                          bool permission = await Permissions
                              .cameraAndMicrophonePermissionsGranted();
                          if (permission) {
                            print("receivers on ontap");
                            print(receivers);
                            print("hiiii");
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
                          width: MediaQuery.of(context).size.height / 4.3,
                          height: MediaQuery.of(context).size.height / 4.3,
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
                SizedBox(height: MediaQuery.of(context).size.height / 10),
                Stack(
                  children: <Widget>[
                    Container(
                      // width: MediaQuery.of(context).size.height / 2,
                      height: MediaQuery.of(context).size.height / 3.6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mediBlue.withOpacity(0.3)),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 7.2 -
                          MediaQuery.of(context).size.height / 7.8,
                      left: MediaQuery.of(context).size.width / 2 -
                          MediaQuery.of(context).size.height / 7.8,
                      child: Container(
                        width: MediaQuery.of(context).size.height / 3.9,
                        height: MediaQuery.of(context).size.height / 3.9,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mediBlue.withOpacity(0.7)),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 7.2 -
                          MediaQuery.of(context).size.height / 8.6,
                      left: MediaQuery.of(context).size.width / 2 -
                          MediaQuery.of(context).size.height / 8.6,
                      child: InkResponse(
                        onTap: () => _makingPhoneCall(),
                        child: Container(
                          width: MediaQuery.of(context).size.height / 4.3,
                          height: MediaQuery.of(context).size.height / 4.3,
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
