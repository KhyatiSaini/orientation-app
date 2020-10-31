import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orientation_app/authentication/sign_up_screen.dart';
import 'package:orientation_app/providers/Sports.dart';
import 'package:orientation_app/providers/clubs.dart';
import 'package:orientation_app/providers/placestoeat.dart';
import 'package:orientation_app/providers/placestovisit.dart';
import 'package:orientation_app/providers/shop.dart';
import 'package:orientation_app/providers/socities.dart';
import 'package:orientation_app/screens/Contributors.dart';
import 'package:orientation_app/screens/places_to_eat_screen.dart';
import 'package:orientation_app/screens/shops.dart';
import 'package:orientation_app/screens/sports_screen.dart';
import 'authentication/Signin.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/hostels_screen.dart';
import 'package:provider/provider.dart';
import 'providers/hostels.dart';
import 'screens/college_map_screen.dart';
import 'screens/location_screen.dart';
import 'screens/club_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/societies.dart';
import 'screens/PlacesToVisitScreen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Hostels()),
        ChangeNotifierProvider(create: (_) => Shops()),
        ChangeNotifierProvider(create: (_) => Clubs()),
        ChangeNotifierProvider(create: (_) => PlacesToVisitProvider()),
        ChangeNotifierProvider(create: (_) => PlacesToEat()),
        ChangeNotifierProvider(create: (_) => Sports()),
        ChangeNotifierProvider(create: (_) => Societies())
      ],
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
          LocationScreen.route: (context) => LocationScreen(),
          ClubsScreen.route: (context) => ClubsScreen(),
          ChatScreen.route: (context) => ChatScreen(),
          SocietyScreen.route: (context) => SocietyScreen(),
          SportsScreen.route: (context) => SportsScreen(),
          PlacesToEatScreen.route: (context) => PlacesToEatScreen(),
          Contributors.route: (context)=>Contributors(),
          PlacesToVisitScreen.route: (context) => PlacesToVisitScreen(),
          ShopScreen.route: (context) => ShopScreen()
        },
      ),
    );
  }
}
