import 'package:flutter/material.dart';
import 'package:fluttercafe/data/auth.dart';
import 'package:fluttercafe/internal/constants.dart';
import 'package:fluttercafe/internal/widgets.dart';

class Register extends StatefulWidget {

  final Function toggleView ;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  AuthRepository _authRepo = AuthRepository();
  String _email;
  String _password;
  String _error = '' ;
  bool isLoading = false ;

  @override
  void dispose() {
    _authRepo = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text("Register"),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              'SignIn',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: isLoading ? Loading() : Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey ,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter valid email': null,
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                onChanged: (val) {
                  _email = val;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (val) => val.length < 6 ? 'Enter valid passord' : null,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                onChanged: (val) {
                  _password = val;
                },
              ),
              SizedBox(height: 40),
              RaisedButton(
                color: Colors.pink[400],
                child: Text('Sign up', style: TextStyle(color: Colors.white)),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    setState(() => isLoading = true);
                    dynamic user = await _authRepo.registerWithEmailAndPassword(_email, _password);
                    setState(() {
                      _error = user == null ? 'Register failed , try with valid data' : '';
                      if(user == null) setState(() => isLoading = false);
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              Text(
                _error ,
                style: TextStyle(color: Colors.red , fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
