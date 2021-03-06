import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  static String route = "/sign-up";

  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String _email;
  String _password;
  String _confirmPassword;
  String _username;
  bool _secureText = true;
  bool isLoading = false;

  @override
  void dispose() {
    // disposing all the controllers else they will lead to memory leaks
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

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

  void signUp(BuildContext context) async {
    bool isValid = _formKey.currentState.validate();
    if (isValid) {
      try {
        setState(() {
          isLoading = true;
        });
        _formKey.currentState.save();
        var resp = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.trim(), password: _password.trim());
        // ignore: deprecated_member_use
        print(_username);
        await FirebaseAuth.instance.currentUser
            .updateProfile(displayName: _username);
        Fluttertoast.showToast(
            msg: "Successfully Signed Up & Logged-In",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white,
            textColor: Colors.blue,
            fontSize: 16.0);
        Navigator.of(context).pop();
      } catch (e) {
        print(e);
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(e.message),
            action: SnackBarAction(
                label: 'Dismiss',
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                })));
        setState(() {
          isLoading = false;
        });
      }
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.blue,
            body: Builder(
              builder: (context) => Container(
                height: MediaQuery.of(context).size.height * 1,
                // child: SingleChildScrollView(
                child: Container(
                    height: MediaQuery.of(context).size.height * 1,
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            // Positioned(
                            //     left: 10,
                            //     top: 10,
                            //     child: MaterialButton(
                            //       onPressed: () {
                            //         Navigator.of(context).pop();
                            //       },
                            //       child: Icon(Icons.arrow_back),
                            //     )),
                            SizedBox(height: 20),
                            Container(
                              alignment: Alignment.topLeft,
                              width: double.infinity,
                              child: Opacity(
                                child: Image.asset(
                                    'assets/images/background2.jpg'),
                                opacity: 0.2,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 85, left: 20),
                              child: Text('Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 180),
                                width: double.infinity,
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
                                      padding:
                                          EdgeInsets.only(left: 20, top: 30),
                                      child: Text(
                                        'Welcome to something',
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
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                'Email',
                                                style: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 15),
                                              child: TextFormField(
                                                enableSuggestions: true,
                                                textInputAction:
                                                    TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                controller: emailController,
                                                validator: (input) =>
                                                    emailValidator(input)
                                                        ? null
                                                        : "Please enter a valid email address",
                                                onChanged: (input) {
                                                  _email = input;
                                                },
                                                decoration: InputDecoration(
                                                  fillColor: Colors.grey[200],
                                                  filled: true,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    borderSide: new BorderSide(
                                                        width: 2,
                                                        color:
                                                            Colors.grey[200]),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    borderSide: new BorderSide(
                                                        width: 2,
                                                        color:
                                                            Colors.grey[200]),
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
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                'Username',
                                                style: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 15),
                                              child: TextFormField(
                                                enableSuggestions: true,
                                                textInputAction:
                                                    TextInputAction.next,
                                                keyboardType:
                                                    TextInputType.text,
                                                controller: userNameController,
                                                onChanged: (input) {
                                                  _username = input;
                                                },
                                                validator: (value) {
                                                  if (value.length < 4) {
                                                    return "username too short!";
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  fillColor: Colors.grey[200],
                                                  filled: true,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    borderSide: new BorderSide(
                                                        width: 2,
                                                        color:
                                                            Colors.grey[200]),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    borderSide: new BorderSide(
                                                        width: 2,
                                                        color:
                                                            Colors.grey[200]),
                                                  ),
                                                  prefixIcon: Icon(
                                                    Icons.account_circle,
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  hintText:
                                                      "Enter your username",
                                                ),
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                'Password',
                                                style: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 15),
                                              child: TextFormField(
                                                controller: passwordController,
                                                textInputAction:
                                                    TextInputAction.next,
                                                onChanged: (input) {
                                                  _password = input;
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
                                                            Radius.circular(
                                                                20)),
                                                    borderSide: new BorderSide(
                                                        width: 2,
                                                        color:
                                                            Colors.grey[200]),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    borderSide: new BorderSide(
                                                        width: 2,
                                                        color:
                                                            Colors.grey[200]),
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
                                                            Icons
                                                                .visibility_off,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5))
                                                        : Icon(
                                                            Icons
                                                                .remove_red_eye,
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
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                'Confirm Password',
                                                style: TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 15),
                                              child: TextFormField(
                                                controller:
                                                    confirmPasswordController,
                                                onChanged: (input) {
                                                  _confirmPassword = input;
                                                },
                                                validator: (input) {
                                                  if (input.length < 6) {
                                                    return "Password too short";
                                                  } else if (_password !=
                                                      _confirmPassword) {
                                                    return "Passwords do not match";
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                  fillColor: Colors.grey[200],
                                                  filled: true,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    borderSide: new BorderSide(
                                                        width: 2,
                                                        color:
                                                            Colors.grey[200]),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    borderSide: new BorderSide(
                                                        width: 2,
                                                        color:
                                                            Colors.grey[200]),
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
                                                            Icons
                                                                .visibility_off,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5))
                                                        : Icon(
                                                            Icons
                                                                .remove_red_eye,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.5)),
                                                  ),
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  hintText: "Confirm Password",
                                                ),
                                                obscureText: _secureText,
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            SizedBox(height: 60),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 15),
                                              width: double.infinity,
                                              height: 50,
                                              child: MaterialButton(
                                                color: Colors.blue,
                                                onPressed: () {
                                                  signUp(context);
                                                },
                                                child: isLoading
                                                    ? SpinKitCircle(
                                                        color: Colors.white,
                                                      )
                                                    : Text('Sign Up',
                                                        style: TextStyle(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.9),
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
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
                                                          context,
                                                          SignIn.route);
                                                    },
                                                    child: Material(
                                                      color: Colors.white,
                                                      child: Text('Sign In',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15)),
                                                    ),
                                                  ),
                                                  SizedBox(height: 30),
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
                      // ),
                    )),
              ),
            )));
  }
}
