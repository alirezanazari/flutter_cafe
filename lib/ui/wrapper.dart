import 'package:flutter/material.dart';
import 'package:fluttercafe/ui/authenticate/authenticate.dart';
import 'package:fluttercafe/ui/home/home.dart';
import 'package:provider/provider.dart';
import 'package:fluttercafe/data/entity/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    return user == null ? Authentication() : Home();
  }
}
