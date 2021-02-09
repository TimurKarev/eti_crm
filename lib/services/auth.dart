import 'package:eti_crm/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  EtiUser _userFromFirebaseUser(User user){
    return user != null ? EtiUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<EtiUser> get user {
    return _auth.authStateChanges()
      //.map((User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  Future signInAnon() async {
    try {
      //UserCredential result = await _auth.signInAnonymously();
      //User user = result.user;
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      return _userFromFirebaseUser(userCredential.user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return _userFromFirebaseUser(result.user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return _userFromFirebaseUser(result.user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // sing out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }  catch(e){
      print(e.toString());
      return null;
    }
  }

}