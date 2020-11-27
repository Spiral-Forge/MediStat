import 'package:cloud_firestore/cloud_firestore.dart';

import 'call.dart';

class CallMethods {
  final CollectionReference callCollection =Firestore.instance.collection("call");

  Stream<DocumentSnapshot> callStream({String uid}) =>
      callCollection.document(uid).snapshots();

  Future<bool> makeCall({Call call}) async {
    try {
      print("coming here in makecall");
      call.hasDialled = true;
      Map<String, dynamic> hasDialledMap = call.toMap(call);

      call.hasDialled = false;
      Map<String, dynamic> hasNotDialledMap = call.toMap(call);
      print("has dialed map");
      print(hasDialledMap);
      print("has not dialed map");
      print(hasNotDialledMap);

      await callCollection.document(call.callerId).setData(hasDialledMap);
      await callCollection.document(call.receiverId).setData(hasNotDialledMap);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> endCall({Call call}) async {
    try {
      await callCollection.document(call.callerId).delete();
      await callCollection.document(call.receiverId).delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
