import 'package:flutter/material.dart';

class bottomNavBar extends StatefulWidget {
  @override
  _bottomNavBarState createState()=> _bottomNavBarState();
}
class _bottomNavBarState extends State<bottomNavBar> {
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