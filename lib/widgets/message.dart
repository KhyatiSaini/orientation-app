import 'dart:math';

import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  String message;
  String username;
  String time;
  bool isCurrentLoggedInUser;

  Message(this.message, this.username, this.isCurrentLoggedInUser);

  List colors = [
    Colors.cyan,
    Colors.cyan[800],
    Colors.cyan[700],
    Colors.cyan[600],
    Colors.cyan[500],
    Colors.cyan[400],
    Colors.cyan[300],
    Colors.lightBlue,
    Colors.lightBlue[900],
    Colors.lightBlue[800],
    Colors.lightBlue[700],
    Colors.lightBlue[600],
    Colors.lightBlue[500],
    Colors.blue,
    Colors.blue[400],
    Colors.blue[500],
    Colors.blue[600],
    Colors.blue[700],
    Colors.blue[800]
  ];

  @override
  Widget build(BuildContext context) {
    String UserIcon() {
      List<String> name = username.split(" ");
      print(name);
      String a = "";
      for (String n in name) {
        a = a + n[0];
      }
      a = a.toUpperCase();
      if (a == "") {
        return "USER";
      }
      if(a.length >2){
        return a.substring(0,2);
      }
      return a;
    }
    double getPadding(){
      return isCurrentLoggedInUser ? 20 : 8;
    }
    double getPadding2(){
      return isCurrentLoggedInUser ? 8 : 20;
    }

    return Stack(
      overflow: Overflow.visible,
      children: [
        Row(
          mainAxisAlignment: isCurrentLoggedInUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(getPadding(), 8 , getPadding2() , 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(message,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
        Positioned(
          child: CircleAvatar(
            backgroundColor: colors[Random().nextInt(19)],
            maxRadius: 20,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text(
                  UserIcon(),
                  style: const TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ),
            ),
          ),
          top: 0,
          left: isCurrentLoggedInUser ? null : 120,
          right: isCurrentLoggedInUser ? 120 : null,
        ),
      ],
    );
  }
}
