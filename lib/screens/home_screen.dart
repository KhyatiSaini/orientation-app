import 'package:flutter/material.dart';
import '../widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      // navigation drawer
      drawer: Drawer(
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
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}
