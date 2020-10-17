import 'package:flutter/material.dart';
import 'package:orientation_app/screens/splash_screen.dart';
import 'package:orientation_app/screens/sign_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signIn(),
      title: 'Pyschic Fresher',
      theme: ThemeData.dark(),
    );
  }
}
