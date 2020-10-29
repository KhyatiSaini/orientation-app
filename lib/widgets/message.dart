import 'dart:math';

import '../utilities/colors.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  String message;
  String username;
  String datetime;
  bool isCurrentLoggedInUser;

  Message(
      this.message, this.username, this.isCurrentLoggedInUser, this.datetime);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  String UserIcon() {
    List<String> name = widget.username.split(" ");
    print(name);
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

  double getPadding() {
    return widget.isCurrentLoggedInUser ? 20 : 8;
  }

  double getPadding2() {
    return widget.isCurrentLoggedInUser ? 8 : 20;
  }

  String getDate() {
    DateTime date = DateTime.parse(widget.datetime);
    return date.day.toString() +
        "/" +
        date.month.toString() +
        "/" +
        date.year.toString();
  }

  String getTime() {
    DateTime date = DateTime.parse(widget.datetime);
    var hour, minute, stamp;
    if (date.hour >= 12) {
      hour = (date.hour - 12).toString();
      stamp = "pm";
    } else {
      hour = date.minute.toString();
      stamp = "am";
    }
    minute = date.minute.toString();
    if (minute.length == 1) {
      minute = "0" + minute;
    }

    return hour + ":" + minute + " " + stamp;
  }


  bool pressed = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pressed = !pressed;
        });
        print(pressed);
      },
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Row(
            mainAxisAlignment: widget.isCurrentLoggedInUser
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: pressed ? 200 : 140,
                  decoration: BoxDecoration(
                      color: colors[Random().nextInt(22)],
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding:
                        EdgeInsets.fromLTRB(getPadding(), 10, getPadding2(), 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: Text(widget.message,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (pressed)
                              Text(
                                getDate(),
                                style: TextStyle(color: Colors.white),
                              ),
                            if (pressed)
                              SizedBox(
                                width: 20,
                              ),
                            Text(
                              getTime(),
                              style: TextStyle(color: Colors.white),
                            )
                          ],
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
              backgroundColor: colors[Random().nextInt(22)],
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
            left: widget.isCurrentLoggedInUser ? null : (pressed ? 180 : 120),
            right: widget.isCurrentLoggedInUser ? (pressed ? 180 : 120) : null,
          ),
        ],
      ),
    );
  }
}

