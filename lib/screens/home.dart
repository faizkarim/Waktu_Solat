import 'package:flutter/material.dart';
import 'package:waktusolat/screens/mosque.dart';
import 'package:waktusolat/screens/prayer_time.dart';
import 'package:waktusolat/screens/toggle.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  int selectedIndex;
  Home({this.selectedIndex = 0});
}

class _HomeState extends State<Home> {
  List<Widget> _widgetOptions = <Widget>[
    PrayerTime(),
    Mosque(),
    Toggle(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Waktu Solat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Masjid',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: widget.selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions[widget.selectedIndex],
    );
  }
}
