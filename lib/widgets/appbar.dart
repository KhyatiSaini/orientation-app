import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

Widget appbar = AppBar(
    title: Text("Psychic Fresher",
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400)),
    actions: [
      DropdownButton(
        icon: Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        onChanged: (value) async {
          if (value == 'logout') {
            FirebaseAuth.instance.signOut();
            try{
              GoogleSignIn _googleSignIn = GoogleSignIn();
              await _googleSignIn.signOut();
            }
            catch(e){
              print(e);
            }

          }
        },
        items: [
          DropdownMenuItem(
              value: 'logout',
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 10),
                    Text("Logout"),
                  ],
                ),
              ))
        ],
      )
    ]);
