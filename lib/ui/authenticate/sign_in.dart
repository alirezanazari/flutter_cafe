import 'package:flutter/material.dart';
import 'package:fluttercafe/data/auth.dart';
import 'package:fluttercafe/internal/constants.dart';

class SignIn extends StatefulWidget {

  final Function toggleView ;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  final AuthRepository _authRepo = AuthRepository();
  String _email;
  String _password;
  String _error = '';

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
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter valid email' : null,
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                onChanged: (val) {
                  _email = val;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (val) => val.length < 6 ? 'Enter valid password' : null ,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                onChanged: (val) {
                  _password = val;
                },
              ),
              SizedBox(height: 40),
              RaisedButton(
                color: Colors.pink[400],
                child: Text('Sign in', style: TextStyle(color: Colors.white)),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    dynamic user = await _authRepo.signInWithEmailAndPassword(_email, _password);
                    setState(() => _error = user == null ? 'Sign in failed , try with valid info' : '');
                  }
                },
              ),
              SizedBox(height: 20),
              Text(
                _error  ,
                style: TextStyle(color: Colors.red , fontSize: 12),
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
