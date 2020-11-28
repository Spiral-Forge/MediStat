import 'package:dbapp/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:cloud_firestore/cloud_firestore.dart';



class AuthMethods {
  static final Firestore _firestore = Firestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  static final Firestore firestore = Firestore.instance;

  static final CollectionReference _userCollection =
      _firestore.collection("users");

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    print("current user is ");
    print(currentUser);
    return currentUser;
  }

  Future<User> getUserDetails() async {
    FirebaseUser currentUser = await getCurrentUser();

    DocumentSnapshot documentSnapshot =
        await _userCollection.document(currentUser.uid).get();
    return User.fromMap(documentSnapshot.data);
  }

  Future<User> getUserDetailsById(id) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _userCollection.document(id).get();
      return User.fromMap(documentSnapshot.data);
    } catch (e) {
      print(e);
      return null;
    }
  }



  // Future<void> addDataToDb(FirebaseUser currentUser) async {
  //   String username = Utils.getUsername(currentUser.email);

  //   User user = User(
  //       uid: currentUser.uid,
  //       email: currentUser.email,
  //       name: currentUser.displayName,
  //       profilePhoto: currentUser.photoUrl,
  //       username: username);

  //   firestore
  //       .collection(USERS_COLLECTION)
  //       .document(currentUser.uid)
  //       .setData(user.toMap(user));
  // }

 




  Stream<DocumentSnapshot> getUserStream({@required String uid}) =>
      _userCollection.document(uid).snapshots();
}
