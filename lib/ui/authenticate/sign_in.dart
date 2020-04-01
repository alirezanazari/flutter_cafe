import 'package:flutter/material.dart';
import 'package:fluttercafe/data/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthRepository _authRepo = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Sign in"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 50),
        child: RaisedButton(
          child: Text('Sign in anon'),
          onPressed: () async{
            dynamic user = await _authRepo.signInAnon();
            if(user != null){
              print('sign in');
              print(user.uid);
            }else{
              print('error');
            }
          },
        ),
      ),
    );
  }
}
