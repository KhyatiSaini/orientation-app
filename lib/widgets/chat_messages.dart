import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:orientation_app/widgets/message.dart';

class ChatMessages extends StatefulWidget {
  @override
  _ChatMessagesState createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        // ignore: missing_return
        builder: (ctx, chatsnapshot) {
          if (chatsnapshot.connectionState == ConnectionState.waiting) {
            return SpinKitFadingFour(color: Colors.blue, size: 60);
          }
          var docs = chatsnapshot.data.documents;

          return ListView.builder(
              itemBuilder: (ctx, index) => Message(docs[index]["message"], docs[index]["username"], docs[index]["uid"] == user.uid, docs[index]["time"]),
              reverse: true,
              itemCount: docs.length);
        },
        // ignore: deprecated_member_use
        stream: Firestore.instance
            .collection("chat")
            .orderBy("time", descending: true)
            .snapshots());
  }
}
