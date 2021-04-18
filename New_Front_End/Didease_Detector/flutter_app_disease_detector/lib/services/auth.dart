import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_disease_detector/models/users.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Users _usersFromFirebaseUser(User user){
    return user != null ? Users(uid: user.uid) : null;
  }

  Stream<Users> get user {
    return _auth.authStateChanges()
    //  .map((User user) => _usersFromFirebaseUser(user));
    .map(_usersFromFirebaseUser);

  }
  
  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;

    }
  }
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }

  }

}