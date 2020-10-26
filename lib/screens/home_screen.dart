import 'package:flutter/material.dart';
import 'package:orientation_app/widgets/BottomNavigationBar.dart';
import 'package:orientation_app/widgets/Drawer.dart';
import '../widgets/appbar.dart';

class HomeScreen extends StatelessWidget {
  static String route = "/home-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      // navigation drawer
      drawer: AppDrawer(),
      body: Container(),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}

