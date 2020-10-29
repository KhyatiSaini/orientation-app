import 'package:flutter/material.dart';
import 'package:orientation_app/widgets/chat_messages.dart';
import 'package:orientation_app/widgets/send_message.dart';

class ChatScreen extends StatefulWidget {
  static String route = "/chatScreen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Box"),
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(child: ChatMessages()),
            SendMessage()
          ],
        ),
      ),
    );
  }
}
