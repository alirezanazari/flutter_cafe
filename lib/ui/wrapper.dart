import 'package:flutter/material.dart';
import 'package:fluttercafe/ui/authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return home if logged in else authenticate (Login , Register) if does'nt
    return Authentication();
  }
}
