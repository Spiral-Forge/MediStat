import 'package:flutter/material.dart';
import 'package:dbapp/screens/home/homepage.dart';
import 'package:dbapp/screens/guide/guide.dart';
import 'package:dbapp/screens/nearme/nearme.dart';
import 'homepage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Guide(),
    NearMe(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
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
