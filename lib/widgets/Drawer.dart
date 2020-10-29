import 'package:flutter/material.dart';
import 'package:orientation_app/screens/chat_screen.dart';
import 'package:orientation_app/screens/places_to_eat_screen.dart';
import '../screens/hostels_screen.dart';
import '../screens/club_screen.dart';
import '../screens/societies.dart';
import '../screens/sports_screen.dart';

class AppDrawer extends StatefulWidget {
  String email;
  String username;
  String icon = "USER";

  AppDrawer(this.email, this.username);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String icon = "";

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400);
    String UserIcon() {
      List<String> name = widget.username.split(" ");
      String a = "";
      for (String n in name) {
        a = a + n[0];
      }
      a = a.toUpperCase();
      if (a == "") {
        return "USER";
      }
      if (a.length > 2) {
        return a.substring(0, 2);
      }
      return a;
    }

    return Drawer(
        child: ListView(children: [
      UserAccountsDrawerHeader(
        accountName: Text(widget.username),
        accountEmail: Text(widget.email),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
              ? Colors.blue
              : Colors.white,
          child: Text(
            UserIcon(),
            style: TextStyle(fontSize: 40.0),
          ),
        ),
      ),
      ListTile(
        onTap: () {},
        leading: CircleAvatar(child: Icon(Icons.camera)),
        title: Text(
          "Latest Posts",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {},
        leading: CircleAvatar(child: Icon(Icons.event)),
        title: Text(
          "Events",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, ChatScreen.route);
        },
        leading: CircleAvatar(child: Icon(Icons.chat)),
        title: Text(
          "Chat Box",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {},
        leading: CircleAvatar(child: Icon(Icons.school)),
        title: Text(
          "Departments",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, ClubsScreen.route);
        },
        leading: CircleAvatar(child: Icon(Icons.local_activity)),
        title: Text(
          "Clubs",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, SocietyScreen.route);
        },
        leading: CircleAvatar(child: Icon(Icons.group)),
        title: Text(
          "Societies",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, SportsScreen.route);
        },
        leading: CircleAvatar(child: Icon(Icons.golf_course)),
        title: Text(
          "Sports",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, HostelsList.route);
        },
        leading: CircleAvatar(child: Icon(Icons.apartment)),
        title: Text(
          "Hostels",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {
          Navigator.pushNamed(context, PlacesToEatScreen.route);
        },
        leading: CircleAvatar(child: Icon(Icons.fastfood)),
        title: Text(
          "Places to Eat",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {},
        leading: CircleAvatar(child: Icon(Icons.landscape)),
        title: Text(
          "Places to visit",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
          onTap: () {},
          leading: CircleAvatar(child: Icon(Icons.store)),
          title: Text(
            "Shops",
            style: style,
          )),
      Divider()
    ]));
  }
}
