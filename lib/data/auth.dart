import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttercafe/data/entity/user.dart';

class AuthRepository{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _getUserFromFirebase(FirebaseUser user) => user == null ? null : User(uid: user.uid);

  //auth user change stream
  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_getUserFromFirebase);
  }

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

  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      return null;
    }
  }

}