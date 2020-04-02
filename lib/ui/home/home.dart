import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttercafe/data/auth.dart';
import 'package:fluttercafe/data/cafe.dart';
import 'package:fluttercafe/data/entity/cafe.dart';
import 'package:fluttercafe/ui/home/add_cafe.dart';
import 'package:fluttercafe/ui/home/cafe_list.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthRepository _auth = AuthRepository();

    void _onAddCafeClicked() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
              child: AddCafeForm(),
            );
          });
    }

    return StreamProvider<List<Cafe>>.value(
      value: CafeRepository().cafes,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cafe List'),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/coffee_bg.png'),
                    fit: BoxFit.cover
                )
            ),
            child: CafeList()
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.brown,
          onPressed: _onAddCafeClicked,
        ),
      ),
    );
  }
}
