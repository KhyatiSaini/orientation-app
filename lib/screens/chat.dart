import 'package:flutter/material.dart';
import 'package:orientation_app/widgets/chat_messages.dart';
import 'package:orientation_app/widgets/send_message.dart';

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(child: ChatMessages()),
          SendMessage(),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
