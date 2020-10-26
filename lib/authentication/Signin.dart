import 'package:flutter/material.dart';
import 'sign_in_screen.dart';
class SignIn extends StatelessWidget {
  static String route = "/sign-in";

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: signIn());
  }
}
