import 'dart:math';

import 'package:dbapp/models/user.dart';
import 'package:flutter/material.dart';

import '../models/call.dart';

import 'call_methods.dart';
import '../screens/vc/callscreen.dart';



class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial({User from, List<User> to, context}) async {
    print("reciever list");
    print(to.length);
    var callList=new List<Call>();
    String channelID=Random().nextInt(1000).toString();
    for(int i=0;i<to.length;i++){
     // print("i in call "+i.toString());
        Call call = new Call(
        callerId: from.uid,
        callerName: from.name,
        receiverId: to[i].uid,
        receiverName: to[i].name,
        channelId: channelID,
        );
        callList.add(call);
    }
   // print("call list");
   // print(callList);
    //  for(int i=0;i<callList.length;i++){
    //    print("call[i] ");
    //     print(callList[i].receiverId);

    // }
    

    // Log log = Log(
    //   callerName: from.name,
    //   callerPic: from.profilePhoto,
    //   callStatus: CALL_STATUS_DIALLED,
    //   receiverName: to.name,
    //   receiverPic: to.profilePhoto,
    //   timestamp: DateTime.now().toString(),
    // );
    bool senderCall=await callMethods.saveSender(callList[0]);
    bool callMade = false;
    for(int j=0;j<callList.length;j++){
      var success=await callMethods.makeCall(call: callList[j]);
      callMade=callMade || success;
    } 
    print("call made"+callMade.toString());
    

    // call.hasDialled = true;
    print("after make call");

    if (senderCall && callMade) {
      // enter log
      // LogRepository.addLogs(log);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallScreen(call: callList[0]),
        ),
      );
   }
  }

 
}
