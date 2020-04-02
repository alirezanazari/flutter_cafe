import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttercafe/data/auth.dart';
import 'package:fluttercafe/data/cafe.dart';
import 'package:fluttercafe/data/entity/cafe.dart';
import 'package:fluttercafe/ui/home/cafe_list.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthRepository _auth = AuthRepository();

    return StreamProvider<List<Cafe>>.value(
      value: CafeRepository().cafes,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Cafe List'),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.person ,
                color: Colors.white,
              ),
              label: Text(
                'Logout' ,
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: CafeList(),
      ),
    );
  }
}
