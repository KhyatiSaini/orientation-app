import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../widgets/fragment.dart';

class bottomNavBar extends StatefulWidget {
  @override
  _bottomNavBarState createState()=> _bottomNavBarState();
}
class _bottomNavBarState extends State<bottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Colors.blue,
          primaryColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(color: Colors.grey),
          )
      ),
      child: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: 0,
        backgroundColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded),
              label: 'Schedule'),
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Maps'),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Posts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info'),
        ],
      ),
    );
  }
}