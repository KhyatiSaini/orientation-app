import 'package:flutter/material.dart';

Widget appbar = AppBar(
  title: Text("Psychic Fresher",
      style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400)),
  actions: [
    PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (_) => [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(
              Icons.person_pin,
              color: Colors.black,
              size: 30,
            ),
            title: Text('Profile'),
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.explore, color: Colors.black, size: 30),
            title: Text('Location'),
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.black,
              size: 30,
            ),
            title: Text('Logout'),
          ),
        ),
      ],
    ),
  ],
);
