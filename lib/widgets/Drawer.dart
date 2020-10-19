import 'package:flutter/material.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Username'),
          accountEmail: Text('username@gmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text('U',
                style: TextStyle(
                  fontSize: 40.0,
                )),
          ),
        ),
      ]),
    ),
  }
}
