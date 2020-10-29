import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendMessage extends StatefulWidget {
  @override
  _SendMessageState createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  String message;
  final controller = new TextEditingController();

  Future<void> sendMessage() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final data = {
        "message": message,
        "email": user.email,
        "username": user.displayName,
        "uid": user.uid,
        "time": Timestamp.now()
      };
      // ignore: deprecated_member_use
      var response = await Firestore.instance.collection('chat').add(data);
      print(response);
      setState(() {
        controller.text = "";
        message = "";
      });
      Fluttertoast.showToast(
          msg: "Message sent successfully.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.blue,
          fontSize: 16.0);
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "There was some error please try again later.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.red,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 8, 0, 8),
            child: TextFormField(
              enableSuggestions: true,
              keyboardType: TextInputType.text,
              controller: controller,
              textInputAction: TextInputAction.send,
              onChanged: (value) {
                setState(() {
                  message = value;
                });
              },
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: new BorderSide(width: 2, color: Colors.grey[200]),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: new BorderSide(width: 2, color: Colors.grey[200]),
                ),
                prefixIcon: Icon(
                  Icons.add_comment,
                  color: Colors.black.withOpacity(1),
                ),
                hintText: "write message",
                hintStyle: TextStyle(color: Colors.grey),
              ),
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ),
        ),
        IconButton(
            icon: Icon(Icons.send),
            onPressed: (message == null || message == "") ? null : sendMessage)
      ],
    );
  }
}
