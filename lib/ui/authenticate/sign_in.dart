import 'package:flutter/material.dart';
import 'package:fluttercafe/data/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView ;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthRepository _authRepo = AuthRepository();
  String _email;

  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Sign in"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'Register',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                onChanged: (val) {
                  _email = val;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  _password = val;
                },
              ),
              SizedBox(height: 40),
              RaisedButton(
                color: Colors.pink[400],
                child: Text('Sign in', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  print(_email);
                  print(_password);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
dynamic user = await _authRepo.signInAnon();
            if(user != null){
              print('sign in');
              print(user.uid);
            }else{
              print('error');
            }
* */
