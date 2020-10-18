import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_screen.dart';
import '../utilities/location.dart';

class SplashScreen extends StatefulWidget {
  static String route = "/splash-screen";

  @override
  _Splash_State createState() => _Splash_State();
}

// ignore: camel_case_types
class _Splash_State extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = new Location();
    var data = await location.getLocationHighAccuracy();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
