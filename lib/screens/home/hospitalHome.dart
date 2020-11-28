import 'package:dbapp/screens/authenticate/authenticate.dart';
import 'package:dbapp/screens/vc/pickuplayout.dart';
import 'package:dbapp/services/auth.dart';
import 'package:flutter/material.dart';

class HospitalHome extends StatefulWidget {
  @override
  _HospitalHomeState createState() => _HospitalHomeState();
}

class _HospitalHomeState extends State<HospitalHome> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return PickupLayout(
          scaffold: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title:Text("myapp"),
          backgroundColor:Colors.brown[400] ,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async{
                await _auth.signOut();
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Authenticate())
                    );
              }, 
              icon: Icon(Icons.person),
              label:Text('logout')
              )
          ],
        ),
        body: Container(child: Text("hospital home"),
        )
        ),
    );
  }
}