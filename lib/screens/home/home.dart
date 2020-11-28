import 'package:dbapp/models/user.dart';
import 'package:dbapp/screens/vc/miniauth.dart';
import 'package:dbapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:dbapp/screens/home/homepage.dart';
import 'package:provider/provider.dart';

import '../authenticate/authenticate.dart';
import 'homepage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Guide'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            title: Text('Near Me'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff01226C),
        onTap: _onItemTapped,
      ),
    );
  }
}
