import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  String message;
  String username;
  bool isCurrentLoggedInUser;

  Message(this.message, this.username, this.isCurrentLoggedInUser);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isCurrentLoggedInUser
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 100,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(message,
                      style: TextStyle(fontSize: 16, color: Colors.white))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
