import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbapp/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DBUtils{
 static final CollectionReference _userCollection = _firestore.collection("users");
  static final Firestore _firestore = Firestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<User> getSender() async {
        FirebaseUser currentUser = await getCurrentUser();

        DocumentSnapshot documentSnapshot =
            await _userCollection.document(currentUser.uid).get();
        print("curr user");
        return User.fromMap(documentSnapshot.data);
      }

    Future getReceiver() async {
   
      var res=await _firestore
        .collection('/users')
        .where('type', isEqualTo: "hospital")
        .getDocuments();
        print("res is");
        print(res.documents);
        return res.documents;
      }

    Future<FirebaseUser> getCurrentUser() async {
        FirebaseUser currentUser;
        currentUser = await _auth.currentUser();
        print("current user is ");
        print(currentUser);
        return currentUser;
    }

  

}