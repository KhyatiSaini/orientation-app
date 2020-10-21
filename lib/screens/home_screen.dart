import 'package:flutter/material.dart';
import 'package:orientation_app/widgets/Drawer.dart';
import '../widgets/appbar.dart';

class HomeScreen extends StatefulWidget {
  static String route = "/home-screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      // navigation drawer
      drawer: AppDrawer(),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: FittedBox(child: Icon(Icons.camera_alt)),
      ),
    );
  }
}
