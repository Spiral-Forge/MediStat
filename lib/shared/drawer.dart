import 'package:flutter/material.dart';
import 'package:dbapp/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class myDrawer extends StatefulWidget {
  @override
  _myDrawerState createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  var userMail = '';
  // AuthMethods auth = new AuthMethods();
  // var userDetails = auth.getUserDetails();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }

  void initState() {
    super.initState();
    getUser().then((user) {
      if (user != null) {
        // userName = user.name;
        // userMail = user.data['email'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          Divider(
            height: 5,
            color: Colors.transparent,
          ),
          new ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 20,
                  child: ClipOval(
                      child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(Icons.person),
                  ))),
              title: new Text(
                "Logged In as",
                style: TextStyle(fontFamily: 'GoogleSans', fontSize: 20),
              ),
              subtitle: new Text(
                "heelo",
                style: TextStyle(fontFamily: 'GoogleSans', fontSize: 13),
              ),
              onTap: () {}),
          new Divider(),
          new ListTile(
              title: new Text(
                "Terms of Use",
                style: TextStyle(fontFamily: 'GoogleSans', fontSize: 15),
              ),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                // Navigator.of(context).pop();
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Guidelines()));
              }),
          new ListTile(
              title: new Text(
                "Contact Info",
                style: TextStyle(fontFamily: 'GoogleSans', fontSize: 15),
              ),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                // Navigator.of(context).pop();
                // Navigator.of(context).push(new MaterialPageRoute(
                //     builder: (BuildContext context) => new FAQS()));
              }),
          new Divider(),
          new ListTile(
              title: new Text(
                "Logout",
                style: TextStyle(fontFamily: 'GoogleSans', fontSize: 15),
              ),
              trailing: new Icon(Icons.call_made),
              onTap: () async {
                await _auth.signOut();
              }),
          new Divider(),
        ],
      ),
    );
  }
}
