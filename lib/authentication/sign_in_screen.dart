import 'package:flutter/material.dart';
import 'sign_up_screen.dart';
// ignore: camel_case_types
class signIn extends StatefulWidget {
  static String route = "/sign-in";

  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email, username, pwd, confirm_pwd;

  bool _secureText = true;

  void toggle() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  bool emailValidator(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.blue,
            body: SingleChildScrollView(
              child: Container(
                  padding: null,
                  margin: null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 20, left: 10),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.arrow_back,
                                    color: Colors.white, size: 28),
                              )),
                          SizedBox(height: 20),
                          Container(
                            alignment: Alignment.topLeft,
                            width: double.infinity,
                            child: Opacity(
                              child:
                                  Image.asset('assets/images/background2.jpg'),
                              opacity: 0.2,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 85, left: 20),
                            child: Text('Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 180),
                              width: double.infinity,
                              height: 700,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(34),
                                    topRight: Radius.circular(34)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 30),
                                    child: Text(
                                      'Welcome back',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text('Hello there',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15)),
                                  ),
                                  SizedBox(height: 30),
                                  Form(
                                      key: _formKey,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Text(
                                              'Email',
                                              style: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 15),
                                            child: TextFormField(
                                              enableSuggestions: true,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              controller: emailController,
                                              textInputAction: TextInputAction.next,
                                              validator: (input) => emailValidator(
                                                      input)
                                                  ? null
                                                  : "Please enter a valid email address",
                                              onChanged: (input) {
                                                email = input;
                                              },
                                              decoration: InputDecoration(
                                                fillColor: Colors.grey[200],
                                                filled: true,
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  borderSide: new BorderSide(
                                                      width: 2,
                                                      color: Colors.grey[200]),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  borderSide: new BorderSide(
                                                      width: 2,
                                                      color: Colors.grey[200]),
                                                ),
                                                prefixIcon: Icon(
                                                  Icons.email,
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                                hintText: "Enter your email",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            )
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Text(
                                              'Password',
                                              style: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 15),

                                            child: TextFormField(
                                              controller: passwordController,
                                              onChanged: (input) {
                                                pwd = input;
                                              },
                                              validator: (input) =>
                                                  input.length < 6
                                                      ? "Password too short!"
                                                      : null,
                                              decoration: InputDecoration(
                                                fillColor: Colors.grey[200],
                                                filled: true,
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  borderSide: new BorderSide(
                                                      width: 2,
                                                      color: Colors.grey[200]),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20)),
                                                  borderSide: new BorderSide(
                                                      width: 2,
                                                      color: Colors.grey[200]),
                                                ),
                                                prefixIcon: Icon(
                                                  Icons.https,
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                ),
                                                suffixIcon: FlatButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      toggle();
                                                    });
                                                  },
                                                  child: _secureText
                                                      ? Icon(
                                                          Icons.visibility_off,
                                                          color: Colors.grey
                                                              .withOpacity(0.5))
                                                      : Icon(
                                                          Icons.remove_red_eye,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.5)),
                                                ),
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                hintText: "Enter a Password",
                                              ),
                                              obscureText: _secureText,
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          SizedBox(height: 60),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 15),
                                            width: double.infinity,
                                            height: 50,
                                            child: MaterialButton(
                                              color: Colors.blue,
                                              onPressed: () => print(
                                                  'sign up button pressed'),
                                              child: Text('Sign Up',
                                                  style: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.9),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 30),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 70),
                                            child: Row(
                                              children: [
                                                Text(
                                                    'Already have an account? ',
                                                    style: TextStyle(
                                                        color: Colors.grey
                                                            .withOpacity(0.7),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w300)),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pushNamed(
                                                        context, SignUp.route);
                                                  },
                                                  child: Material(
                                                    color: Colors.white,
                                                    child: Text('Sign Up',
                                                        style: TextStyle(
                                                            color: Colors.blue,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15)),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              )),
                        ],
                      ),
                    ],
                  )),
            )));
  }
}
