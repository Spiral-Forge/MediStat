import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbapp/models/hospital.dart';
import 'package:dbapp/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  static final Firestore firestore = Firestore.instance;

  static final CollectionReference _userCollection =
      firestore.collection("users");

  //create user object based on firebase user
  User _userFromFireBaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, email: user.email) : null;
  }

  //auth change using stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFireBaseUser);
  }

  //sign in with google
    Future<FirebaseUser> googleSignIn() async{
      GoogleSignInAccount googleSignInAccount=await _googleSignIn.signIn();
      GoogleSignInAuthentication gsa=await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: gsa.accessToken,
        idToken: gsa.idToken,
      );
      final AuthResult authResult = await _auth.signInWithCredential(credential);
      FirebaseUser user = authResult.user;
      var userMap= new Map<String,String>();
      userMap["email"]=user.email;
      userMap["uid"]=user.uid;
      userMap["type"]="user";
      userMap["name"]=user.displayName;
       //userMap["contact"]=user;
      
      await _userCollection.document(user.uid).setData(userMap);
      return user;
  }

  //sign in with email and password
  Future signin(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future register(String email,String password,String name) async{
    try{
      AuthResult result=await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      var userDb=new User();
      userDb.uid=result.user.uid;
      userDb.email=email;
      userDb.type="user";
      userDb.name=name;
      
      await _userCollection.document(result.user.uid).setData(userDb.toMap(userDb));
      FirebaseUser user=result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register hospital with email and password
  Future registerHospital(Map userMap) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: userMap["email"], password: userMap["password"]);
      var hospital = new Hospital();
      hospital.uid = result.user.uid;
      hospital.email = userMap["email"];
      hospital.type = "hospital";
      hospital.name = userMap["name"];
      hospital.address = userMap["address"];
      hospital.contact = userMap["contact"];

      await _userCollection
          .document(result.user.uid)
          .setData(hospital.toMap(hospital));
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      await _googleSignIn.signOut();
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
