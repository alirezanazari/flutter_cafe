import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttercafe/data/entity/user.dart';

class AuthRepository{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _getUserFromFirebase(FirebaseUser user) => User(uid: user.uid);

  //sign in anonymous
  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _getUserFromFirebase(user);
    }catch(e){
      print(e);
      return null;
    }
  }

  

}