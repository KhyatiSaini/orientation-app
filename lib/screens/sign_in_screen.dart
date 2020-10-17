import 'package:flutter/material.dart';

// ignore: camel_case_types
class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0073e1),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  flex: 1),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Welcome Back",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 24),
                                  ))),
                          Expanded(
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      "Hello there, sign in to continue!",
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)))),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          )),
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                      borderSide: new BorderSide(
                                          color: Colors.black54, width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                      borderSide: new BorderSide(
                                          color: Colors.black54)),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  hintStyle: TextStyle(color: Colors.black),
                                  hintText: "abc@gmail.com",
                                  suffixIcon: Icon(
                                    Icons.done_outline,
                                    color: Colors.red,
                                  )),
                            ),
                          ),
                          Expanded(
                              child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Password",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                          )),
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                      borderSide: new BorderSide(
                                          color: Colors.black54, width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                      borderSide: new BorderSide(
                                          color: Colors.black54)),
                                  prefixIcon: Icon(
                                    Icons.https,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showPass = !showPass;
                                      });
                                    },
                                    child: showPass
                                        ? Icon(
                                            Icons.visibility,
                                            color: Colors.black,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Colors.black,
                                          ),
                                  ),
                                  hintStyle: TextStyle(color: Colors.black),
                                  hintText: "********"),
                              obscureText: showPass,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                              child: FlatButton(
                            onPressed: () {
                              print("Try SignIn");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Container(
                                  width: 180,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff0073e1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  )),
                                ),
                              ),
                            ),
                          )),
                          Expanded(
                            flex: 2,
                            child: Text(""),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account ? ",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "Sign up ",
                                  style: TextStyle(
                                      color: Color(0xff0073e1),
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white,
                    ),
                  ),
                  flex: 6)
            ],
          ),
        ),
      ),
    );
  }
}
