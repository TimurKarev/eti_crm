import 'package:eti_crm/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  EtiUser _userFromFirebaseUser(User user){
    return user != null ? EtiUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    _auth.authStateChanges().listen((User user) {
      print ('Stream' + user.toString());
      return user;
    });
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
}