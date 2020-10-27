import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orientation_app/authentication/sign_in_screen.dart';
import 'package:orientation_app/authentication/sign_up_screen.dart';
import 'authentication/Signin.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/hostels_screen.dart';
import 'package:provider/provider.dart';
import 'providers/hostels.dart';
import 'screens/college_map_screen.dart';
import 'screens/location_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Hostels())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          // ignore: deprecated_member_use
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("User Logged in");
              return HomeScreen();
            } else {
              return WelcomeScreen();
            }
          },
        ),
        title: 'Pyschic Fresher',
        routes: {
          WelcomeScreen.route: (context) => WelcomeScreen(),
          SignUp.route: (context) => SignUp(),
          SignIn.route: (context) => SignIn(),
          HomeScreen.route: (context) => HomeScreen(),
          HostelsList.route: (context) => HostelsList(),
          NithMapScreen.route: (context) => NithMapScreen(),
          LocationScreen.route: (context) => LocationScreen()
        },
      ),
    );
  }
}
