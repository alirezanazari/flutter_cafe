import 'package:flutter/material.dart';
import 'package:fluttercafe/ui/authenticate/register.dart';
import 'package:fluttercafe/ui/authenticate/sign_in.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isSignIn = true;

  void toggleView() {
    setState(() => isSignIn = !isSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return isSignIn ? SignIn(toggleView: toggleView) : Register(toggleView: toggleView);
  }
}
