import 'package:dbapp/screens/sidebar/contact.dart';
import 'package:dbapp/screens/sidebar/terms.dart';
import 'package:dbapp/services/miniauth.dart';
import 'package:flutter/material.dart';
import 'package:dbapp/services/auth.dart';

class myDrawer extends StatefulWidget {
  @override
  _myDrawerState createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  var userMail = '';
  var userName = '';
  AuthMethods auth = new AuthMethods();

  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    var user = await auth.getUserDetails();
    setState(() {
      userMail = user.email;
      userName = user.name;
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
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: new Text(
                  "Logged in as",
                  style: TextStyle(fontFamily: 'GoogleSans', fontSize: 16),
                ),
              ),
              subtitle: new Text(
                userName + "\n" + userMail,
                style: TextStyle(fontFamily: 'GoogleSans', fontSize: 14),
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
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Terms()));
              }),
          new ListTile(
              title: new Text(
                "Contact Info",
                style: TextStyle(fontFamily: 'GoogleSans', fontSize: 15),
              ),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Contact()));
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
