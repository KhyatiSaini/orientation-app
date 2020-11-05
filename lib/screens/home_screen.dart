import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:orientation_app/screens/chat.dart';
import 'package:orientation_app/screens/college_map_screen.dart';
import 'package:orientation_app/screens/image_upload_screen.dart';
import 'package:orientation_app/screens/navigation_screen.dart';
import 'package:orientation_app/widgets/Drawer.dart';
import '../widgets/appbar.dart';
import 'feed.dart';

class HomeScreen extends StatefulWidget {
  static String route = "/home-screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  final Key key1 = new Key("bottom bar");
  String username = " ";
  String email = " ";
  int _currentIndex = 0;
  final List<Widget> _children = [
    UserPostsFeed(),
    NithMapScreen(),
    ImageUploadScreen(),
    NavigationScreen(),
    ChatWidget(),
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    var details = FirebaseAuth.instance.currentUser;
    var name = details.displayName;
    setState(() {
      email = details.email;
      username = name == null ? " " : name;
    });
    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(onMessage: (msg) {
      print(msg);
      return;
    }, onLaunch: (msg) {
      print(msg);
      return;
    }, onResume: (msg) {
      print(msg);
      return;
    });

    _tabController = TabController(vsync: this, length: _children.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: appbar,
      backgroundColor: Colors.white,
      drawer: AppDrawer(email, username),
      body: TabBarView(
        children: _children,
        controller: _tabController,
        physics: NeverScrollableScrollPhysics()
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.blue,
        items: [
          Icon(Icons.dynamic_feed, size: 30, color: Colors.white),
          Icon(Icons.map, size: 30, color: Colors.white),
          Icon(Icons.camera, size: 30, color: Colors.white),
          Icon(Icons.explore, size: 30, color: Colors.white),
          Icon(Icons.message, size: 30, color: Colors.white),
        ],
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(
          milliseconds: 200,
        ),
        onTap: (index) {
          setState(() {
            // _currentIndex = index;
            _tabController.index = index;
          });
          print('current index is $index');
        },
      ),
    );
  }
}
