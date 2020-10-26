import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:orientation_app/screens/college_map_screen.dart';
import 'package:orientation_app/widgets/Drawer.dart';
import '../widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  static String route = "/home-screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Container(),
    NithMapScreen(),
    Container(),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.blue,
        items: [
          Icon(Icons.calendar_today_rounded, size: 30, color: Colors.white),
          Icon(Icons.map, size: 30, color: Colors.white),
          Icon(Icons.camera, size: 30, color: Colors.white),
          Icon(Icons.info, size: 30, color: Colors.white),
        ],
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(
          milliseconds: 250,
        ),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          print('current index is $index');
        },
      ),
    );
  }
}