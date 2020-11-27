import 'package:dbapp/screens/guide/guide.dart';
import 'package:dbapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:dbapp/screens/home/homepage.dart';
import 'package:dbapp/screens/nearme/nearme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Guide(),
    // Text(
    //   'Index 1: Business',
    //   style: optionStyle,
    // ),
    NearMe(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
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
            icon: Icon(Icons.place),
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
