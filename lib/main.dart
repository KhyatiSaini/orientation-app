import 'package:flutter/material.dart';
import 'package:orientation_app/authentication/sign_in_screen.dart';
import 'package:orientation_app/authentication/sign_up_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      title: 'Pyschic Fresher',
      // theme: ThemeData.dark(),
      routes: {
        WelcomeScreen.route: (context) => WelcomeScreen(),
        SignUp.route: (context) => SignUp(),
        signIn.route: (context) => signIn(),
        HomeScreen.route: (context) => HomeScreen()
      },
    );
  }
}
