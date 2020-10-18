import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState()=> _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // styling using custom painter
                Container(
                  color: Colors.blue,
                  child: CustomPaint(
                    // painter: CurvePainter(),
                  ),
                ),
                Container(
                  // color: Colors.blueGrey,
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(10),
                  // width: double.infinity,
                  // height: 300,
                  child: ClipRRect(
                    child: Image.asset('assets/images/background1.jpg'),
                    borderRadius: BorderRadius.circular(200.0),
                  ),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(20), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(20)),
                  // ),
                ),
                Container(
                  margin: null,
                  child: Text('Welcome',
                    style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('lorem ipsum dolor sit amet',
                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, color: Colors.white))
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('lorem ipsum dolor sit amet',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white))
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  width: double.infinity,
                  child: MaterialButton(
                    height: 48,
                    color: Colors.white,
                    onPressed: ()=>print('sign-in with google'),
                    child: Text('Sign in with Google',
                      style: TextStyle(color: Colors.blue, fontSize: 15.0, fontWeight: FontWeight.bold),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  width: double.infinity,
                  child: MaterialButton(
                    height: 48,
                    color: Colors.blue,
                    onPressed: ()=>print('create new account'),
                    child: Text('Create an account',
                    style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white, width: 2, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(17.0),
                    )
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(width: 50,),
                      Text('Already have an account? ', style: TextStyle(color: Colors.white),),
                      Material(
                        color: Colors.blue,
                        child: Text('Sign In', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        )
      );
  }
}