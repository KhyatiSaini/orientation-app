import 'package:flutter/material.dart';
import 'package:orientation_app/authentication/sign_in_screen.dart';
import 'package:orientation_app/authentication/sign_up_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/hostels_screen.dart';
import 'package:provider/provider.dart';
import 'providers/hostels.dart';
import 'screens/college_map_screen.dart';
import 'screens/location_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Hostels())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        title: 'Pyschic Fresher',
        // theme: ThemeData.dark(),
        routes: {
          WelcomeScreen.route: (context) => WelcomeScreen(),
          SignUp.route: (context) => SignUp(),
          signIn.route: (context) => signIn(),
          HomeScreen.route: (context) => HomeScreen(),
          HostelsList.route: (context) => HostelsList(),
          NithMapScreen.route: (context) => NithMapScreen()
        },
      ),
    );
  }
}
