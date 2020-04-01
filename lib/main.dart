import 'package:flutter/material.dart';
import 'package:fluttercafe/data/entity/user.dart';
import 'package:fluttercafe/ui/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:fluttercafe/data/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthRepository().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}