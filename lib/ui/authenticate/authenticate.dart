import 'package:flutter/material.dart';
import 'package:fluttercafe/ui/authenticate/sign_in.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
