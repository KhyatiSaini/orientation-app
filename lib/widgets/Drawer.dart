import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400);

    return Drawer(
        child: ListView(children: [
      UserAccountsDrawerHeader(
        accountName: Text("Mrigank Anand"),
        accountEmail: Text("abcd@gmail.com"),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
              ? Colors.blue
              : Colors.white,
          child: Text(
            "A",
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
        onTap: () {},
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
        onTap: () {},
        leading: CircleAvatar(child: Icon(Icons.local_activity)),
        title: Text(
          "Clubs",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {},
        leading: CircleAvatar(child: Icon(Icons.group)),
        title: Text(
          "Societies",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {},
        leading: CircleAvatar(child: Icon(Icons.golf_course)),
        title: Text(
          "Sports",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {},
        leading: CircleAvatar(child: Icon(Icons.apartment)),
        title: Text(
          "Hostels",
          style: style,
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {},
        leading: CircleAvatar(child: Icon(Icons.fastfood)),
        title: Text(
          "Food Courts",
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
