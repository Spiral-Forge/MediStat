import 'dart:math';

import 'package:flutter/material.dart';

import 'call.dart';

import 'call_methods.dart';
import 'callscreen.dart';
import 'user.dart';


class CallUtils {
  static final CallMethods callMethods = CallMethods();

  static dial({User from, User to, context}) async {
    Call call = Call(
      callerId: from.uid,
      callerName: from.email,
      receiverId: to.uid,
      receiverName: to.email,
      channelId: Random().nextInt(1000).toString(),
    );

    // Log log = Log(
    //   callerName: from.name,
    //   callerPic: from.profilePhoto,
    //   callStatus: CALL_STATUS_DIALLED,
    //   receiverName: to.name,
    //   receiverPic: to.profilePhoto,
    //   timestamp: DateTime.now().toString(),
    // );

    bool callMade = await callMethods.makeCall(call: call);

    call.hasDialled = true;
    print("after make call");

    if (callMade) {
      // enter log
      // LogRepository.addLogs(log);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallScreen(call: call),
        ),
      );
    }
  }

 
}
