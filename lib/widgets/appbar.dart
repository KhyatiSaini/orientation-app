import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

Widget appbar = AppBar(
    title: Text("Gaze NIT-H",
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400)),
    actions: [
      IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            FirebaseAuth.instance.signOut();
            try {
              GoogleSignIn _googleSignIn = GoogleSignIn();
              await _googleSignIn.signOut();

              Fluttertoast.showToast(
                  msg: "Successfully Logged-Out",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Colors.blue,
                  fontSize: 16.0);
            } catch (e) {
              print(e);
            }
          })

      // DropdownButton(
      //   icon: Icon(
      //     Icons.more_vert,
      //     color: Colors.white,
      //   ),
      //   onChanged: (value) async {
      //     if (value == 'logout') {
      //       FirebaseAuth.instance.signOut();
      //       try{
      //         GoogleSignIn _googleSignIn = GoogleSignIn();
      //         await _googleSignIn.signOut();
      //
      //
      //         Fluttertoast.showToast(
      //             msg: "Successfully Logged-Out",
      //             toastLength: Toast.LENGTH_SHORT,
      //             gravity: ToastGravity.BOTTOM,
      //             timeInSecForIosWeb: 1,
      //             backgroundColor: Colors.white,
      //             textColor: Colors.blue,
      //             fontSize: 16.0
      //         );
      //       }
      //       catch(e){
      //         print(e);
      //       }
      //
      //     }
      //   },
      //   items: [
      //     DropdownMenuItem(
      //         value: 'logout',
      //         child: Container(
      //           child: Row(
      //             children: [
      //               Icon(Icons.exit_to_app),
      //               SizedBox(width: 10),
      //               Text("Logout"),
      //             ],s
      //           ),
      //         ))
      //   ],
      // )
    ]);
